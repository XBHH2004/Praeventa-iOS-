import SwiftUI

struct WarningCard: View {
    let title: String
    let message: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(title, systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundStyle(.red)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.red.opacity(0.08))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.red.opacity(0.25), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    WarningCard(
        title: "Lebensgefahr",
        message: "Die Person reagiert nicht. Prüfen Sie sofort die Atmung."
    )
    .padding()
}
