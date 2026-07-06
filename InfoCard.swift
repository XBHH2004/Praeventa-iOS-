import SwiftUI

struct InfoCard: View {
    let title: String
    let message: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(title, systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundStyle(.blue)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.08))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.blue.opacity(0.25), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    InfoCard(
        title: "Hinweis",
        message: "Prüfen Sie die Atmung maximal 10 Sekunden."
    )
    .padding()
}
