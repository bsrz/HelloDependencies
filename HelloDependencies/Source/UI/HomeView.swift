import Dependencies
import ProfileData
import ProfileDomain
import SwiftUI

struct HomeView: View {

    @Dependency(\.profileRepository) private var repo

    @State private var userCount = 0

    var body: some View {
        Button("Add User (\(userCount))") {
            let user = User(name: "foo")
            repo.add(user: user)
            userCount = repo.allUsers().count
        }
        .task {
            userCount = repo.allUsers().count
        }
    }
}
