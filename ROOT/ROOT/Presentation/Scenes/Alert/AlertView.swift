import SwiftUI

struct AlertView: View {
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
                        // 버튼 동작 추가
                    }) {
                        Image("back")
                    }
                }
            }
        }
    }
}

#Preview {
    AlertView()
}
