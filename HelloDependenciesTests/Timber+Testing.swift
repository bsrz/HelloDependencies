import Timber
import os.log

extension Destination {
    static func makeTestDestination(_ send: @escaping (Message, Execution) -> Void) -> Destination {
        .init(
            send: { message, _, execution in
                send(message, execution)
            }
        )
    }
}
