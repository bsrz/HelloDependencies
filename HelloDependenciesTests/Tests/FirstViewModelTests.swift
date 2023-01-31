@testable import HelloDependencies
import Dependencies
import Timber
import XCTest

final class FirstViewModelTests: XCTestCase {

    func testViewModel_whenLogErrorActionIsSent_logsErrorMessage() throws {
        var messages: [Message] = []
        let destination = Destination.makeTestDestination { message, _ in
            messages.append(message)
        }

        let sut = withDependencies {
            $0.logger = .init(
                config: .init(
                    destinations: [destination]
                )
            )
        } operation: {
            FirstViewModel()
        }

        sut.send(.logError)

        XCTAssertEqual(messages.count, 1)
        let message = try XCTUnwrap(messages.first)
        XCTAssertEqual(message.level, .error)
    }
}
