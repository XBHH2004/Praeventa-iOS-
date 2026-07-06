import SwiftUI

struct PanicModeView: View {

    var body: some View {

        NavigationStack {

            VStack(spacing: 30) {

                Spacer()

                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.red)

                Text("Bleib ruhig.")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Wir führen dich jetzt Schritt für Schritt durch die Situation.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                Spacer()

                NavigationLink {

                    UnconsciousFlowView()

                } label: {

                    PrimaryButton(
                        title: "Assistent starten",
                        systemImage: "arrow.right.circle.fill",
                        color: .red
                    ) { }

                }

                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PanicModeView()
}
