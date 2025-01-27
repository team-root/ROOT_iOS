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

                VStack {
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}


