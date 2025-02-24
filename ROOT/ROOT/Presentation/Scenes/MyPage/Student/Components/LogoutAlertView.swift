import SwiftUI

struct LogoutAlertView: View {
    @Binding var isPresent: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 257, height: 114)
                .foregroundStyle(.gray700)
                .cornerRadius(10)
            VStack(spacing: 10) {
                Text("로그아웃")
                    .rootFont(.body(.body1), color: .gray100)
                    .multilineTextAlignment(.center)
                Text("정말 로그아웃 하시겠습니까?")
                    .rootFont(.caption(.caption2), color: .gray100)
                HStack(spacing: 20) {
                    Button(action: {
                        isPresent = false
                    }) {
                        Text("취소")
                            .rootFont(.body(.body3), color: .gray100)
                            .padding(.vertical, 6)
                    }
                    .frame(width: 100)
                    .background(.gray550)
                    .cornerRadius(5)
                    Button(action: {
                        isPresent = false
                    }) {
                        Text("로그아웃")
                            .rootFont(.body(.body3), color: .gray100)
                            .padding(.vertical, 6)
                    }
                    .frame(width: 100)
                    .background(.main100)
                    .cornerRadius(5)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray600
        LogoutAlertView(isPresent: .constant(false))
    }
}
