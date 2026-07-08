import SwiftUI
import Combine
import UIKit

struct CPRSessionView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var seconds = 0
    @State private var beat = false
    @State private var compressions = 0
    @State private var cycle = 1
    @State private var isBreathing = false
    @State private var breathingCountdown = 5
    @State private var isPaused = false
    @State private var showCallAlert = false
    @State private var showEndAlert = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let beatTimer = Timer.publish(every: 60.0 / 110.0, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 18) {

            HStack {
                VStack(alignment: .leading) {
                    Text("❤️ REANIMATION")
                        .font(.title)
                        .fontWeight(.bold)

                    Text(timeString)
                        .font(.system(size: 38, weight: .bold, design: .rounded))
                        .monospacedDigit()
                }

                Spacer()

                VStack {
                    Text("\(cycle)")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                    Text("Zyklus")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            if isBreathing {
                CPRBreathingView(countdown: breathingCountdown)
            } else {
                CPRPulseView(beat: beat)
                CPRCounter(compressions: compressions)

                Text("110 BPM")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(spacing: 12) {
                if isBreathing {
                    PrimaryButton(title: "Weiterdrücken", systemImage: "heart.fill", color: .red) {
                        startNextCycle()
                    }
                } else {
                    PrimaryButton(title: isPaused ? "Fortsetzen" : "Pause", systemImage: isPaused ? "play.fill" : "pause.fill", color: isPaused ? .green : .orange) {
                        isPaused.toggle()
                    }
                }

                PrimaryButton(title: "Notruf 112", systemImage: "phone.fill", color: .red) {
                    showCallAlert = true
                }

                Button("Einsatz beenden") {
                    showEndAlert = true
                }
                .foregroundStyle(.secondary)
            }
        }
        .padding()
        .onAppear {
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            UIApplication.shared.isIdleTimerDisabled = false
        }
        .onReceive(timer) { _ in
            guard !isPaused else { return }

            seconds += 1

            if isBreathing {
                if breathingCountdown > 1 {
                    breathingCountdown -= 1
                } else {
                    startNextCycle()
                }
            }
        }
        .onReceive(beatTimer) { _ in
            guard !isPaused && !isBreathing else { return }

            beat = true
            compressions += 1

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
                beat = false
            }

            if compressions >= 30 {
                isBreathing = true
                breathingCountdown = 5
                beat = false
            }
        }
        .alert("Notruf 112 anrufen?", isPresented: $showCallAlert) {
            Button("Abbrechen", role: .cancel) { }
            Button("Jetzt anrufen", role: .destructive) {
                if let url = URL(string: "tel://112") {
                    UIApplication.shared.open(url)
                }
            }
        } message: {
            Text("Nur im echten Notfall anrufen.")
        }
        .alert("Einsatz beenden?", isPresented: $showEndAlert) {
            Button("Abbrechen", role: .cancel) { }
            Button("Beenden", role: .destructive) {
                UIApplication.shared.isIdleTimerDisabled = false
                dismiss()
            }
        } message: {
            Text("Der aktuelle CPR-Fortschritt wird beendet.")
        }
    }

    private func startNextCycle() {
        cycle += 1
        compressions = 0
        breathingCountdown = 5
        isBreathing = false
    }

    private var timeString: String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

#Preview {
    CPRSessionView()
}
