import SwiftUI
import Combine

enum CPRPhase {
    case ready
    case compressions
    case breathing
    case paused
}

struct CPRView: View {

    @State private var phase: CPRPhase = .ready
    @State private var seconds = 0
    @State private var beat = false
    @State private var compressions = 0
    @State private var cycle = 1
    @State private var breathingCountdown = 5

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let beatTimer = Timer.publish(every: 60.0 / 110.0, on: .main, in: .common).autoconnect()
    let breathingTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

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
                    if let url = URL(string: "tel://112") {
                        UIApplication.shared.open(url)
                    }
                }

                Button("Zurücksetzen") {
                    phase = .ready
                    seconds = 0
                    beat = false
                    compressions = 0
                    cycle = 1
                    breathingCountdown = 5
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        }
        .padding()
        .navigationTitle("Reanimation")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(timer) { _ in
            if phase == .compressions || phase == .breathing {
                seconds += 1
            }
        }
        .onReceive(beatTimer) { _ in
            guard phase == .compressions else { return }

            beat.toggle()
            compressions += 1

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
    }

    private func startCompressions() {
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
