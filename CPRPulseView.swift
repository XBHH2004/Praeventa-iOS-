import SwiftUI

struct CPRPulseView: View {

    let beat: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red.opacity(beat ? 0.28 : 0.12))
                .frame(width: beat ? 230 : 185, height: beat ? 230 : 185)

            VStack(spacing: 10) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 44))
                    .foregroundStyle(.red)

                Text("DRÜCKEN")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
            }
        }
        .frame(width: 240, height: 240)
        .animation(.easeInOut(duration: 0.18), value: beat)
    }
}

#Preview {
    CPRPulseView(beat: true)
}
