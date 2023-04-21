@testable import ProfileData

import Dependencies
import Logging
import ProfileDomain
import Timber
import XCTest

class DefaultProfileRepositoryTests: XCTestCase {

    func testRepository_whenAddingUser_logsMessage() {
        var messages: [String] = []
        let logger = Logger(
            config: .init(
                destinations: [
                    .init { message, _, _ in
                        messages.append(message.message)
                    }
                ]
            )
        )

        let sut = withDependencies {
            $0.logger = logger
        } operation: {
            DefaultProfileRepository()
        }

        XCTAssertEqual(sut.allUsers().count, 0)

        let user = User(id: .init(uuidString: "00000000-0000-0000-0000-000000000000")!, name: name)
        sut.add(user: user)

        XCTAssertEqual(sut.allUsers().count, 1)
        XCTAssertEqual(sut.allUsers()[0].id.uuidString, "00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(sut.allUsers()[0].name, name)

        XCTAssertEqual(messages.count, 5)
        XCTAssertEqual(messages[0], "[PERSISTENCE] User count: 0")
        XCTAssertEqual(messages[1], "[PERSISTENCE] Adding new user with id: 00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(messages[2], "[PERSISTENCE] User count: 1")
        XCTAssertEqual(messages[3], "[PERSISTENCE] User count: 1")
        XCTAssertEqual(messages[4], "[PERSISTENCE] User count: 1")
    }
}
