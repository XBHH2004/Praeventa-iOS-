import SwiftUI

struct SettingsView: View {

    var body: some View {

        NavigationStack {

            List {

                Section("App") {

                    Label("Offline-Modus", systemImage: "wifi.slash")

                    Label("Notruf", systemImage: "phone.fill")

                    Label("Datenschutz", systemImage: "lock.fill")

                }

                Section("PRAEVENTA") {

                    Label("Version 1.0", systemImage: "info.circle")

                    Label("Feedback", systemImage: "envelope")

                }

            }
            .navigationTitle("Einstellungen")

        }

    }
}

#Preview {
    SettingsView()
}
