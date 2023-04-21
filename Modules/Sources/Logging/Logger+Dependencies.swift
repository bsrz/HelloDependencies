import Dependencies
import Timber

public enum LoggerDependencyKey: DependencyKey {
    public static let liveValue: Logger = .timber
}

extension DependencyValues {
    public var logger: Logger {
        get { self[LoggerDependencyKey.self] }
        set { self[LoggerDependencyKey.self] = newValue }
    }
}
