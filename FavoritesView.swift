import SwiftUI

struct FavoritesView: View {

    var body: some View {

        NavigationStack {

            VStack(spacing:30) {

                Image(systemName:"star.circle.fill")
                    .font(.system(size:70))
                    .foregroundStyle(.yellow)

                Text("Noch keine Favoriten")
                    .font(.title2)

                Text("Markiere wichtige Inhalte mit ★.")
                    .foregroundStyle(.secondary)

            }
            .navigationTitle("Favoriten")
        }

    }
}

#Preview {
    FavoritesView()
}
