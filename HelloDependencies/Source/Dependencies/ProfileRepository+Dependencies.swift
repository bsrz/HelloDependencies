import Dependencies

private enum ProfileRepositoryDependencyKey: DependencyKey {
    static let liveValue: ProfileRepository = .init()
//    static let previewValue: ProfileRepository = .init()
}

extension DependencyValues {
    var profileRepository: ProfileRepository {
        get { self[ProfileRepositoryDependencyKey.self] }
        set { self[ProfileRepositoryDependencyKey.self] = newValue }
    }
}
