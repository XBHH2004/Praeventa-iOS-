import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Start", systemImage: "house.fill") }
            EmergencyView().tabItem { Label("Notfall", systemImage: "cross.case.fill") }
            KnowledgeView().tabItem { Label("Wissen", systemImage: "book.fill") }
            FavoritesView().tabItem { Label("Favoriten", systemImage: "star.fill") }
            SettingsView().tabItem { Label("Einstellungen", systemImage: "gearshape.fill") }
        }
    }
}


struct KnowledgeView: View {
    var body: some View {
        NavigationStack {
            Text("Medizinisches Wissen")
                .navigationTitle("Wissen")
        }
    }
}

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            Text("Noch keine Favoriten")
                .navigationTitle("Favoriten")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Text("Einstellungen")
                .navigationTitle("Einstellungen")
        }
    }
}

#Preview {
    ContentView()
}
