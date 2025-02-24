import SwiftUI

struct MyPageButton: View {
    let text: String
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .rootFont(.body(.body4), color: textColor)
                .padding(.vertical, 18)
                .padding(.leading, 20)
            Spacer()
            Image("right")
                .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray550)
        .cornerRadius(15)
    }
}

#Preview {
    MyPageButton(text: "봉사 활동 내역 조회", textColor: .gray100, action: {})
    
}
