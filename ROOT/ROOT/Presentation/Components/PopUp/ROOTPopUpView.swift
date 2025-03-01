import SwiftUI

struct ROOTPopUpView: View {
    @Binding var isPresent: Bool
    let title: String
    let content: String

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 244, height: 197)
                .foregroundStyle(.gray550)
                .border(.gray500)
                .cornerRadius(10)
                
            VStack(spacing: 0) {
                Image("check")
                Text(title)
                    .rootFont(.body(.body3), color: .gray100)
                    .padding(.vertical, 3)
                Text(content)
                    .rootFont(.caption(.caption3), color: .gray300)
                    .padding(.bottom, 13)
                Button(action: {}) {
                    Text("확인")
                        .rootFont(.caption(.caption3), color: .gray100)
                }
                .frame(width: 204, height: 35)
                .background(.main200)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ROOTPopUpView(isPresent: .constant(true), title: "신청 완료!", content: "봉사 활동 신청이 완료되었습니다.")
}
