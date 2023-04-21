import Dependencies
import Logging

public protocol Tracker {
    func track(event: Event)
}

public struct Event {
    public var name: String
    public var attributes: [String: String] = [:]
}

extension Event {
    public static var onLaunch: Self { .init(name: #function) }
}

private class LiveTracker: Tracker {

    @Dependency(\.logger) private var logger

    func track(event: Event) {
        logger.log(.default(.info, "event: \(event.name)"))
    }
}

private enum TrackerDependencyKey: DependencyKey {
    static let liveValue: Tracker = LiveTracker()
}

extension DependencyValues {
    public var tracker: Tracker {
        get { self[TrackerDependencyKey.self] }
        set { self[TrackerDependencyKey.self] = newValue }
    }
}
