import SwiftUI

struct PanicModeView: View {
    var body: some View {
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
                    EmergencyDecisionView()
                } label: {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                        Text("Assistent starten")
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
            .navigationTitle("Notfall")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    PanicModeView()
}
