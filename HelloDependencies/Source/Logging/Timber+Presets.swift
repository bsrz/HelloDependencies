import Timber
import os.log

extension Destination {
    static let hello: Destination = .init(
        send: { message, config, execution in
            let msg = MessageFormatter.format(
                message: message,
                config: config,
                execution: execution
            )

            os_log("%s", log: .hello, msg)
        }
    )
}

extension Timber.Logger {
    public static let hello: Timber.Logger = .init(
        config: .init(
            destinations: [.hello]
        )
    )
}

extension OSLog {
    static let hello = OSLog(
        subsystem: "io.srz.HelloDependencies",
        category: "io.srz.HelloDependencies"
    )
}
