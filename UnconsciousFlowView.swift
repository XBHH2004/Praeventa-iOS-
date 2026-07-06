import SwiftUI

struct UnconsciousFlowView: View {

    @State private var step = 1

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {

                EmergencyHeader(
                    title: "🚨 Bewusstlosigkeit",
                    subtitle: "Person reagiert nicht oder wirkt nicht ansprechbar."
                )

                WarningCard(
                    title: "Lebensgefahr",
                    message: "Bei Bewusstlosigkeit sofort ruhig bleiben, Eigenschutz beachten und die Atmung prüfen."
                )

                if step == 1 {
                    questionCard(
                        title: "Reagiert die Person?",
                        message: "Sprechen Sie die Person laut an und rütteln Sie vorsichtig an den Schultern.",
                        primaryTitle: "Ja, sie reagiert",
                        primaryIcon: "checkmark.circle.fill",
                        primaryColor: .green,
                        primaryAction: { step = 10 },
                        secondaryTitle: "Nein, keine Reaktion",
                        secondaryIcon: "xmark.circle.fill",
                        secondaryColor: .red,
                        secondaryAction: { step = 2 }
                    )
                }

                if step == 2 {
                    questionCard(
                        title: "Atmung prüfen",
                        message: "Kopf leicht überstrecken. Maximal 10 Sekunden schauen, hören und fühlen.",
                        primaryTitle: "Atmung vorhanden",
                        primaryIcon: "lungs.fill",
                        primaryColor: .green,
                        primaryAction: { step = 3 },
                        secondaryTitle: "Keine normale Atmung",
                        secondaryIcon: "heart.fill",
                        secondaryColor: .red,
                        secondaryAction: { step = 4 }
                    )
                }

                if step == 3 {
                    resultCard(
                        title: "Stabile Seitenlage",
                        message: "Person in stabile Seitenlage bringen, Atmung regelmäßig kontrollieren und 112 rufen.",
                        color: .green
                    )
                }

                if step == 4 {
                    resultCard(
                        title: "Reanimation starten",
                        message: "Sofort 112 rufen und mit Herzdruckmassage beginnen.",
                        color: .red
                    )
                }

                if step == 10 {
                    resultCard(
                        title: "Weiter beobachten",
                        message: "Person weiter beobachten. Bei Verschlechterung sofort 112 rufen.",
                        color: .blue
                    )
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
                    step = 1
                }
                .foregroundStyle(.secondary)
                .padding(.top, 6)

            }
            .padding()
        }
        .navigationTitle("Bewusstlosigkeit")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func questionCard(
        title: String,
        message: String,
        primaryTitle: String,
        primaryIcon: String,
        primaryColor: Color,
        primaryAction: @escaping () -> Void,
        secondaryTitle: String,
        secondaryIcon: String,
        secondaryColor: Color,
        secondaryAction: @escaping () -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            Text(message)
                .foregroundStyle(.secondary)

            PrimaryButton(
                title: primaryTitle,
                systemImage: primaryIcon,
                color: primaryColor,
                action: primaryAction
            )

            PrimaryButton(
                title: secondaryTitle,
                systemImage: secondaryIcon,
                color: secondaryColor,
                action: secondaryAction
            )
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }

    private func resultCard(
        title: String,
        message: String,
        color: Color
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(color)

            Text(message)
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    UnconsciousFlowView()
}
