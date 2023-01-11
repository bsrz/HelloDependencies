import Dependencies
import SwiftUI

class FirstViewModel: ObservableObject {

    @Dependency(\.logger) var logger

    // MARK: - Input
    enum Action {
        case logError
        case logWarning
    }

    func send(_ action: Action) {
        switch action {
        case .logError:
            logger.log(.default(.error, "Hello, Dependencies"))

        case .logWarning:
            logger.log(.default(.warning, "Hello, Dependencies"))
        }
    }
}

struct FirstView: View {

    @StateObject private var viewModel: FirstViewModel = .init()

    var body: some View {
        VStack {
            Spacer()
            Button("Error") {
                viewModel.send(.logError)
            }
            Spacer()
            Button("Warning") {
                viewModel.send(.logWarning)
            }
            Spacer()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
