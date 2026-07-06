import SwiftUI

struct PrimaryButton: View {
    let title: String
    let systemImage: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)

                Text(title)
                    .fontWeight(.semibold)
            }
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 58)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PrimaryButton(
        title: "Notruf 112",
        systemImage: "phone.fill",
        color: .red
    ) {
        
    }
    .padding()
}
