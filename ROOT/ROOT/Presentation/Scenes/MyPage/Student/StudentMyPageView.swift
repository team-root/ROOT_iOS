import SwiftUI

struct StudentMyPageView: View {
    @State private var clickAlertButton: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray600
                    .ignoresSafeArea()
                NavigationLink(isActive: $clickAlertButton) {
                    AlertView(returnToHome: $clickAlertButton)
                } label: {
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("마이페이지")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        clickAlertButton = true
                        print("alert button")
                    }) {
                        Image("bell")
                    }
                }
            }
        }
    }
}
#Preview {
    StudentMyPageView()
}
