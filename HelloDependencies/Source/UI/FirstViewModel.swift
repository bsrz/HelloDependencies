import Dependencies
import SwiftUI

class FirstViewModel: ObservableObject {

    @Dependency(\.logger) private var logger
    @Dependency(\.profileRepository) private var repository

    // MARK: - Input
    enum Action {
        case blockUserId(String)
        case logError
        case logWarning
    }

    func send(_ action: Action) {
        switch action {
        case .blockUserId(let id):
            isLoading = true
            Task {
                try await repository.block(userId: id)
                await MainActor.run { isLoading = false }
            }

        case .logError:
            logger.log(.default(.error, "Hello, Dependencies"))

        case .logWarning:
            logger.log(.default(.warning, "Hello, Dependencies"))
        }
    }

    // MARK: - Output
    @Published private(set) var isLoading = false
}
