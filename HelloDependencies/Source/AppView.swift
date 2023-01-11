import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    VStack {
                        Image(systemName: "swift")
                        Text("First")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
