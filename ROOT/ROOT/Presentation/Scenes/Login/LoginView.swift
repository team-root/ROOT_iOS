import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray600)
                    .ignoresSafeArea()
                VStack {
                    Text("로그인")
                        .rootFont(.heading(.heading3))
                        .foregroundColor(.gray100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    Text("Xquare 계정으로 로그인 해주세요!")
                        .rootFont(.body(.body3))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray100)
                    Spacer()
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 30)

                VStack(alignment: .leading, spacing: 20) {
                    ROOTAuthTextField(
                        title: .constant("아이디"),
                        text: .constant("아이디"),
                        placeholder: .constant("아이디를 입력해주세요."),
                        error: .constant("존재하지 않는 아이디입니다."))

                    ROOTAuthTextField(
                        title: .constant("비밀번호"),
                        text: .constant("비밀번호"),
                        placeholder: .constant("비밀번호를 입력해주세요."),
                        error: .constant("비밀번호가 일치하지 않습니다."))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}


