import SwiftUI

struct CPRDemoView: View {

    @Binding var beat: Bool

    var body: some View {

        VStack(spacing: 18) {

            ZStack {

                Circle()
                    .fill(Color.red.opacity(0.10))
                    .frame(width: 190, height: 190)
                    .scaleEffect(beat ? 1.08 : 1.0)
                    .animation(.easeInOut(duration: 0.4), value: beat)

                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 80))
                    .foregroundStyle(.red)
                    .scaleEffect(beat ? 0.92 : 1.0)
                    .animation(.easeInOut(duration: 0.4), value: beat)

            }

            Text("Mitte des Brustkorbs drücken")
                .font(.headline)

            Text("30 Kompressionen • ca. 5–6 cm tief • 100–120/min")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

        }
    }
}

#Preview {

    CPRDemoView(
        beat: .constant(false)
    )

}
