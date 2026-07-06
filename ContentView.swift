import SwiftUI

struct ContentView: View {

    @State private var selectedTab = 0

    var body: some View {

        TabView(selection: $selectedTab) {

            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Start", systemImage: "house.fill")
                }
                .tag(0)

            EmergencyView()
                .tabItem {
                    Label("Notfall", systemImage: "cross.case.fill")
                }
                .tag(1)

            KnowledgeView()
                .tabItem {
                    Label("Wissen", systemImage: "book.fill")
                }
                .tag(2)

            FavoritesView()
                .tabItem {
                    Label("Favoriten", systemImage: "star.fill")
                }
                .tag(3)

            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
