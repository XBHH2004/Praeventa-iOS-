import SwiftUI

struct CPRBreathingView: View {

    let countdown: Int

    var body: some View {
        VStack(spacing: 22) {
            Image(systemName: "lungs.fill")
                .font(.system(size: 70))
                .foregroundStyle(.blue)

            Text("2 Beatmungen")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("\(countdown)")
                .font(.system(size: 86, weight: .bold, design: .rounded))
                .monospacedDigit()
                .foregroundStyle(.blue)

            Text("Wenn geschult und möglich. Sonst sofort weiterdrücken.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}

#Preview {
    CPRBreathingView(countdown: 5)
}
