import SwiftUI

struct EmergencyHeader: View {

    let title: String
    let subtitle: String

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(subtitle)
                .font(.title3)
                .foregroundStyle(.secondary)

        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }

}

#Preview {
    EmergencyHeader(
        title: "🚨 Bewusstlosigkeit",
        subtitle: "Person reagiert nicht."
    )
    .padding()
}
