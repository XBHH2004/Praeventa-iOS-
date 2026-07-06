import SwiftUI

struct HomeView: View {

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: 24) {

                    Text("PRAEVENTA")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Wissen. Handeln. Helfen.")
                        .foregroundStyle(.secondary)

                    VStack(spacing: 16) {

                        HomeCard(
                            title: "🚨 Notfall",
                            subtitle: "Sofort handeln"
                        )

                        HomeCard(
                            title: "🩺 Symptome",
                            subtitle: "Symptome erkennen"
                        )

                        HomeCard(
                            title: "💊 Medikamente",
                            subtitle: "Sicher anwenden"
                        )

                        HomeCard(
                            title: "📚 Wissen",
                            subtitle: "Leitlinien & Erste Hilfe"
                        )

                    }

                }
                .padding()

            }
            .navigationTitle("Start")

        }

    }

}

#Preview {
    HomeView()
}
