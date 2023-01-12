import Dependencies

class ProfileRepository {

    @Dependency(\.logger) private var logger

    func block(userId: String) async throws {
        logger.log(.network(.info, "Attempting to block user id:", userId))
        try await Task.sleep(for: .seconds(2))
        logger.log(.network(.info, "Successfully blocked user id:", userId))
    }
}
