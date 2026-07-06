import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationStack {

            VStack(spacing: 30) {

                Spacer()

                Image(systemName: "cross.case.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.red)

                Text("PRAEVENTA")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Wissen. Handeln. Helfen.")
                    .foregroundStyle(.gray)

                Spacer()

                VStack(spacing: 20) {

                    Button("🚨 Notfall") {

                    }

                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                    Button("🩺 Symptome") {

                    }

                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                }

                .padding()

            }

            .padding()

        }

    }

}

#Preview {
    ContentView()
}
