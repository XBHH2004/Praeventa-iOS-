import SwiftUI
import Combine

struct CPRView: View {

    @State private var isRunning = false
    @State private var seconds = 0

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                EmergencyHeader(
                    title: "❤️ Reanimation",
                    subtitle: "Keine normale Atmung."
                )

                WarningCard(
                    title: "Sofort handeln",
                    message: "Rufen Sie 112 und beginnen Sie sofort mit der Herzdruckmassage."
                )

                InfoCard(
                    title: "Frequenz",
                    message: "Drücken Sie 100–120 mal pro Minute in der Mitte des Brustkorbs."
                )

                Text(timeString)
                    .font(.system(size: 64, weight: .bold, design: .rounded))
                    .monospacedDigit()
                    .padding(.top)

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
                }
                .foregroundStyle(.secondary)
                .padding(.top, 6)
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
