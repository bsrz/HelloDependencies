import Dependencies
import Foundation

private enum UUIDDependencyKey: DependencyKey {
    static let liveValue: () -> UUID = UUID.init
    static let previewValue: () -> UUID = { .init(uuidString: "00000000-0000-0000-0000-000000000000")! }
}

extension DependencyValues {
    var uuid: () -> UUID {
        get { self[UUIDDependencyKey.self] }
        set { self[UUIDDependencyKey.self] = newValue }
    }
}
