import SwiftUI

struct HomeView: View {

    @Binding var selectedTab: Int

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    VStack(alignment: .leading, spacing: 8) {
                        Text("PRAEVENTA")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Bereit zu helfen.")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Im Notfall")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        PrimaryButton(
                            title: "Ich habe einen Notfall",
                            systemImage: "exclamationmark.triangle.fill",
                            color: .red
                        ) {
                            selectedTab = 1
                        }
                    }

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Schnellzugriff")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        HomeCard(title: "❤️ Reanimation", subtitle: "Herzdruckmassage starten")
                        HomeCard(title: "🧠 Schlaganfall", subtitle: "FAST-Test und Soforthilfe")
                        HomeCard(title: "💔 Herzinfarkt", subtitle: "Warnzeichen erkennen")
                        HomeCard(title: "🫁 Atemnot", subtitle: "Richtig handeln")
                    }

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Weitere Bereiche")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        HomeCard(title: "📚 Medizinisches Wissen", subtitle: "Erste Hilfe verständlich erklärt")
                        HomeCard(title: "⭐ Favoriten", subtitle: "Wichtige Inhalte schnell öffnen")
                    }
                }
                .padding()
            }
            .navigationTitle("Start")
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(0))
}
