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

                        NavigationLink {
                            PanicModeView()
                        } label: {
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                Text("Ich habe einen Notfall")
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
