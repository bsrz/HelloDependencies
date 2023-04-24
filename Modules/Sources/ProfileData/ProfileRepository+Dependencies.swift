import Dependencies
import ProfileDomain

public enum ProfileRepositoryDependencyKey: DependencyKey {
    public static var liveValue: ProfileRepository = DefaultProfileRepository()
}

extension DependencyValues {
    public var profileRepository: ProfileRepository {
        get { self[ProfileRepositoryDependencyKey.self] }
        set { self[ProfileRepositoryDependencyKey.self] = newValue }
    }
}
