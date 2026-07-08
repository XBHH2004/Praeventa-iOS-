import SwiftUI

struct CPRStatusHeader: View {

    let timeString: String
    let cycle: Int

    var body: some View {
        HStack {
            VStack {
                Text(timeString)
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .monospacedDigit()

                Text("Zeit")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack {
                Text("\(cycle)")
                    .font(.system(size: 34, weight: .bold, design: .rounded))

                Text("Zyklus")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CPRStatusHeader(
        timeString: "02:37",
        cycle: 4
    )
}
