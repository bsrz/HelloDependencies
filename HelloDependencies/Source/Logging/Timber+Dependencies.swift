import Dependencies
import Timber

private enum LoggerDependencyKey: DependencyKey {
    static let liveValue: Logger = .hello
}

extension DependencyValues {
    var logger: Logger {
        get { self[LoggerDependencyKey.self] }
        set { self[LoggerDependencyKey.self] = newValue }
    }
}
