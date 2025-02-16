import SwiftUI

struct AlertView: View {
    @Binding var returnToHome: Bool

    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray600)
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("알림")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        returnToHome = false
                    }) {
                        Image("back")
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}


