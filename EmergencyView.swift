import SwiftUI
struct EmergencyView: View {
    let emergencies = [
        ("Bewusstlosigkeit", "person.fill.questionmark", Color.red),
        ("Herzstillstand", "heart.fill", Color.red),
        ("Schlaganfall", "brain.head.profile", Color.orange),
        ("Herzinfarkt", "waveform.path.ecg", Color.red),
        ("Atemnot", "lungs.fill", Color.blue),
        ("Starke Blutung", "drop.fill", Color.red),
        ("Verbrennung", "flame.fill", Color.orange),
        ("Vergiftung", "pills.fill", Color.purple)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 14) {
                    ForEach(emergencies, id: \.0) { item in
                        NavigationLink {
                            if item.0 == "Bewusstlosigkeit" {
                                UnconsciousFlowView()
                            } else {
                                EmergencyDetailView(title: item.0)
                            }
                        } label: {
                            HStack {
                                Image(systemName: item.1)
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .frame(width: 46, height: 46)
                                    .background(item.2)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.0)
                                        .font(.headline)

                                    Text("Schritt-für-Schritt Anleitung")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .padding(.horizontal)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Notfall")
        }
    }
}

struct EmergencyDetailView: View {
    let title: String

    var body: some View {
        List {
            Section("Sofortmaßnahmen") {
                Text("1. Eigenschutz beachten.")
                Text("2. Person laut ansprechen und vorsichtig rütteln.")
                Text("3. Atmung prüfen.")
                Text("4. Notruf 112 wählen.")
                Text("5. Bei normaler Atmung: stabile Seitenlage.")
                Text("6. Bei keiner normalen Atmung: Reanimation beginnen.")
            }

            Section("Wichtig") {
                Text("Diese App ersetzt keinen Notruf. Bei Lebensgefahr sofort 112 wählen.")
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle(title)
    }
}

