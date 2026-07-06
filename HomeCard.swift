import SwiftUI

struct HomeCard: View {

    let title: String
    let subtitle: String

    var body: some View {

        HStack {

            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18))

    }
}
