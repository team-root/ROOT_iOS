import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Color(.gray600)
            VStack {
                Text("로그인")
                    .ROOTStyle(.heading3)
                    .lineSpacing(48)
                    .foregroundColor(.gray100)
                    .padding(5)
                Text("Xquare 계정으로 로그인 해주세요!")
                    .ROOTStyle(.body4)
                    .lineSpacing(20)
                    .foregroundColor(.gray100)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}


