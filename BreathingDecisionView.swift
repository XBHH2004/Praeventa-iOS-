import SwiftUI

struct BreathingDecisionView: View {
    var body: some View {
        VStack(spacing: 28) {
            Spacer()

            Image(systemName: "lungs.fill")
                .font(.system(size: 90))
                .foregroundStyle(.blue)

            Text("Atmet die Person normal?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            InfoCard(
                title: "Atmung prüfen",
                message: "Kopf leicht überstrecken. Maximal 10 Sekunden schauen, hören und fühlen."
            )

            Spacer()

            NavigationLink {
                UnconsciousFlowView()
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Ja, normale Atmung")
                        .fontWeight(.semibold)
                }
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .buttonStyle(.plain)

            NavigationLink {
                CPRView()
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Nein, keine normale Atmung")
                        .fontWeight(.semibold)
                }
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .buttonStyle(.plain)

            Spacer()
        }
        .padding()
        .navigationTitle("Atmung prüfen")
    }
}

#Preview {
    NavigationStack {
        BreathingDecisionView()
    }
}
