import SwiftUI
import Combine
import UIKit

enum CPRPhase {
    case ready
    case compressions
    case breathing
    case paused
}

enum CPRAlert: Identifiable {
    case reset
    case call

    var id: String {
        switch self {
        case .reset: return "reset"
        case .call: return "call"
        }
    }
}

struct CPRView: View {

    @State private var phase: CPRPhase = .ready
    @State private var seconds = 0
    @State private var beat = false
    @State private var compressions = 0
    @State private var cycle = 1
    @State private var breathingCountdown = 5
    @State private var activeAlert: CPRAlert?

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let beatTimer = Timer.publish(every: 60.0 / 110.0, on: .main, in: .common).autoconnect()
    let breathingTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private let feedback = UIImpactFeedbackGenerator(style: .light)

    var body: some View {
        VStack(spacing: 14) {

            Text("❤️ Reanimation")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Keine normale Atmung")
                .foregroundStyle(.secondary)

            HStack {
                VStack {
                    Text(timeString)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .monospacedDigit()

                    Text("Zeit")
                        .font(.caption)
                        .foregroundStyle(.secondary)
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
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            if phase == .breathing {
                CPRBreathingView(countdown: breathingCountdown) {
                    startCompressions()
                }
                .frame(height: 300)
            } else {
                VStack(spacing: 8) {
                    CPRPulseView(beat: beat)
                    CPRCounter(compressions: compressions)
                }
                .frame(height: 350)
            }

            Spacer(minLength: 4)

            VStack(spacing: 10) {
                PrimaryButton(
                    title: phase == .compressions ? "Pause" : "Reanimation starten",
                    systemImage: phase == .compressions ? "pause.fill" : "heart.fill",
                    color: phase == .compressions ? .orange : .red
                ) {
                    if phase == .compressions {
                        phase = .paused
                    } else {
                        startCompressions()
                    }
                }

                PrimaryButton(
                    title: "Notruf 112",
                    systemImage: "phone.fill",
                    color: .red
                ) {
                    activeAlert = .call
                }
            }
        }
        .padding()
        .navigationTitle("Reanimation")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    activeAlert = .reset
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                }
            }
        }
        .alert(item: $activeAlert) { alert in
            switch alert {
            case .reset:
                return Alert(
                    title: Text("Reanimation beenden?"),
                    message: Text("Zeit, Zyklus und aktueller Fortschritt werden zurückgesetzt."),
                    primaryButton: .destructive(Text("Beenden")) {
                        UIApplication.shared.isIdleTimerDisabled = false
                        phase = .ready
                        seconds = 0
                        beat = false
                        compressions = 0
                        cycle = 1
                        breathingCountdown = 5
                    },
                    secondaryButton: .cancel(Text("Abbrechen"))
                )

            case .call:
                return Alert(
                    title: Text("Notruf 112 anrufen?"),
                    message: Text("Nur im echten Notfall anrufen."),
                    primaryButton: .destructive(Text("Jetzt anrufen")) {
                        if let url = URL(string: "tel://112") {
                            UIApplication.shared.open(url)
                        }
                    },
                    secondaryButton: .cancel(Text("Abbrechen"))
                )
            }
        }
        .onReceive(timer) { _ in
            if phase == .compressions || phase == .breathing {
                seconds += 1
            }
        }
        .onReceive(beatTimer) { _ in
            guard phase == .compressions else { return }

            beat = true
            compressions += 1
            feedback.impactOccurred(intensity: 0.7)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
                beat = false
            }

            if compressions >= 30 {
                phase = .breathing
                beat = false
                breathingCountdown = 5
            }
        }
        .onReceive(breathingTimer) { _ in
            guard phase == .breathing else { return }

            if breathingCountdown > 1 {
                breathingCountdown -= 1
            } else {
                startCompressions()
            }
        }
        .onDisappear {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }

    private func startCompressions() {
        UIApplication.shared.isIdleTimerDisabled = true
        feedback.prepare()

        if phase == .breathing {
            cycle += 1
        }

        phase = .compressions
        compressions = 0
        breathingCountdown = 5
        beat = false
    }

    private var timeString: String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

#Preview {
    CPRView()
}
