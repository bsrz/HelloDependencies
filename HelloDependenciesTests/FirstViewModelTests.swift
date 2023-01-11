@testable import HelloDependencies
import Dependencies
import Timber
import XCTest

final class FirstViewModelTests: XCTestCase {

    func testViewModel_whenLogErrorActionIsSent_logsErrorMessage() throws {
        var messages: [Message] = []
        let viewModel = withDependencies {
            $0.logger = .init(
                config: .init(
                    destinations: [
                        .init(send: { message, _, _ in
                            messages.append(message)
                        })
                    ]
                )
            )
        } operation: {
            FirstViewModel()
        }

        viewModel.send(.logError)

        XCTAssertEqual(messages.count, 1)
        let message = try XCTUnwrap(messages.first)
        XCTAssertEqual(message.level, .error)
    }
}
