import Foundation

public protocol ProfileRepository {

    func add(user: User)
    func allUsers() -> [User]
}

public struct User: Identifiable {
    public let id: UUID
    public var name: String

    public init(id: UUID = .init(), name: String) {
        self.id = id
        self.name = name
    }
}
