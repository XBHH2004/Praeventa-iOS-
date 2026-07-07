import SwiftUI

struct CPRCounter: View {

    let compressions: Int

    var body: some View {

        VStack(spacing: 8) {

            Text("\((compressions % 30 == 0 && compressions > 0) ? 30 : compressions % 30)")
                .font(.system(size: 72, weight: .bold, design: .rounded))
                .monospacedDigit()

            Text("von 30 Kompressionen")
                .foregroundStyle(.secondary)

        }

    }

}

#Preview {
    CPRCounter(compressions: 17)
}
