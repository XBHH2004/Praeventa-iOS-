import SwiftUI

struct EmergencyDecisionView: View {

    var body: some View {

        VStack(spacing: 30) {

            Spacer()

            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 90))
                .foregroundStyle(.red)

            Text("Ist die Person ansprechbar?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text("Sprich die Person laut an und rüttle vorsichtig an den Schultern.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            Spacer()

            NavigationLink {
                Text("Weitere Hilfe für ansprechbare Personen folgt.")
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Ja")
                        .fontWeight(.semibold)
                }
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .buttonStyle(.plain)

            NavigationLink {
                BreathingDecisionView()
            } label: {
                HStack {
                    Image(systemName: "xmark.circle.fill")
                    Text("Nein")
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
        .navigationTitle("Notfall-Assistent")
    }
}

#Preview {
    NavigationStack {
        EmergencyDecisionView()
    }
}
