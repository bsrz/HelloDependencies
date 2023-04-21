import Dependencies
import Foundation
import Logging
import ProfileDomain

class DefaultProfileRepository: ProfileRepository {

    @Dependency(\.logger) private var logger

    private var users: [User] = []

    func add(user: User) {
        logger.log(.persistence(.info, "Adding new user with id: \(user.id.uuidString)"))
        users.append(user)
    }

    func allUsers() -> [User] {
        logger.log(.persistence(.info, "User count: \(users.count)"))
        return users
    }
}

public enum ProfileRepositoryDependencyKey: DependencyKey {
    public static var liveValue: ProfileRepository = DefaultProfileRepository()
}

extension DependencyValues {
    public var profileRepository: ProfileRepository {
        get { self[ProfileRepositoryDependencyKey.self] }
        set { self[ProfileRepositoryDependencyKey.self] = newValue }
    }
}
