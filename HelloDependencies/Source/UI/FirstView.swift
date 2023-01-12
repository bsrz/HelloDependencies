import SwiftUI

struct FirstView: View {

    @StateObject private var viewModel: FirstViewModel = .init()

    @State private var userId = ""

    var body: some View {
        ZStack {
            VStack {
                Group {
                    TextField("User ID", text: $userId)
                    Button("Block") {
                        viewModel.send(.blockUserId(userId))
                    }
                    .disabled(userId.isEmpty)
                }
                .padding(.horizontal, 40)

                Spacer()

                Button("Error") {
                    viewModel.send(.logError)
                }

                Spacer()

                Button("Warning") {
                    viewModel.send(.logWarning)
                }

                Spacer()
            }

            if viewModel.isLoading {
                ProgressView()
            }
        }
        .disabled(viewModel.isLoading)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
