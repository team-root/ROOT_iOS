import SwiftUI

struct LoginView: View {
    @State private var inputIdText: String = ""
    @State private var inputPasswordText: String = ""
    @State private var clickLoginButton: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray600)
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("로그인")
                            .rootFont(.heading(.heading3), color: .gray100)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        Text("Xquare 계정으로 로그인 해주세요!")
                            .rootFont(.body(.body3), color: .gray100)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 50)
                    .padding(.horizontal, 30)

                    VStack(alignment: .leading, spacing: 20) {
                        ROOTAuthTextField(
                            title: "아이디",
                            text: $inputIdText,
                            placeholder: "아이디를 입력해주세요.",
                            error: "존재하지 않는 아이디입니다.")

                        ROOTAuthTextField(
                            title: "비밀번호",
                            text: $inputPasswordText,
                            placeholder: "비밀번호를 입력해주세요.",
                            error: "비밀번호가 일치하지 않습니다.",
                            isSecureField: true
                        )
                        Spacer()
                    }
                    ROOTButton(title: "로그인", isEnabled: true) {
                        clickLoginButton = true
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 25)

                    NavigationLink(
                        destination: StudentTabBarView(),
                        isActive: $clickLoginButton,
                        label: {EmptyView()})
                }
            }
        }
    }
}

#Preview {
    LoginView()
}


