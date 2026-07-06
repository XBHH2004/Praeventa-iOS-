import SwiftUI

struct KnowledgeView: View {

    var body: some View {
        NavigationStack {

            List {

                Section("Erste Hilfe") {
                    Label("Reanimation", systemImage: "heart.fill")
                    Label("Herzinfarkt", systemImage: "waveform.path.ecg")
                    Label("Schlaganfall", systemImage: "brain.head.profile")
                    Label("Atemnot", systemImage: "lungs.fill")
                    Label("Bewusstlosigkeit", systemImage: "person.fill.questionmark")
                }

                Section("Medizin") {
                    Label("Anatomie", systemImage: "figure.stand")
                    Label("Medikamente", systemImage: "pills.fill")
                    Label("Vitalzeichen", systemImage: "stethoscope")
                }
            }
            .navigationTitle("Wissen")
        }
    }
}

#Preview {
    KnowledgeView()
}
