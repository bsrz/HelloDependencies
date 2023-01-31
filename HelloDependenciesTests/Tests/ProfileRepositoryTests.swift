@testable import HelloDependencies
import Dependencies
import Timber
import XCTest

class ProfileRepositoryTests: XCTestCase {

    func testRepository_whenBlockingUserId_logsMessages() async throws {
        var messages: [Message] = []
        let destination = Destination.makeTestDestination { message, _ in
            messages.append(message)
        }

//        let sut = withDependencies {
//            $0.logger = .init(
//                config: .init(
//                    destinations: [destination]
//                )
//            )
//        } operation: {
//            ProfileRepository()
//        }

        let sut = ProfileRepository()

        try await sut.block(userId: "foo")
        XCTAssertEqual(messages.count, 2)
//        XCTAssertEqual(messages[0].message, "[NETWORK] Attempting to block user id: foo")
//        XCTAssertEqual(messages[1].message, "[NETWORK] Successfully blocked user id: foo")
    }
}
