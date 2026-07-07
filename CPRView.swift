import SwiftUI
import Combine

struct CPRView: View {

    @State private var isRunning = false
    @State private var seconds = 0
    @State private var beat = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let beatTimer = Timer.publish(every: 60.0 / 110.0, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {

                EmergencyHeader(
                    title: "❤️ Reanimation",
                    subtitle: "Keine normale Atmung."
                )

                WarningCard(
                    title: "Sofort handeln",
                    message: "112 rufen und sofort mit der Herzdruckmassage beginnen."
                )

                InfoCard(
                    title: "Takt",
                    message: "Drücken Sie fest und schnell: 100–120 mal pro Minute. Dieser Takt läuft mit 110/min."
                )

                ZStack {
                    Circle()
                        .fill(Color.red.opacity(beat ? 0.28 : 0.12))
                        .frame(width: beat ? 220 : 180, height: beat ? 220 : 180)

                    Text("DRÜCKEN")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                }
                .animation(.easeInOut(duration: 0.18), value: beat)
                .padding(.vertical)

                Text(timeString)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .monospacedDigit()

                PrimaryButton(
                    title: isRunning ? "Pause" : "Reanimation starten",
                    systemImage: isRunning ? "pause.fill" : "heart.fill",
                    color: isRunning ? .orange : .red
                ) {
                    isRunning.toggle()
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
                    isRunning = false
                    seconds = 0
                    beat = false
                }
                .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Reanimation")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(timer) { _ in
            if isRunning {
                seconds += 1
            }
        }
        .onReceive(beatTimer) { _ in
            if isRunning {
                beat.toggle()
            }
        }
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
