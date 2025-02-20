import SwiftUI

struct LocationButton: View {
    let text: String

    var body: some View {
        Button(action: {}) {
            Image("location")
                .padding(.horizontal, 11)
            Text(text)
                .rootFont(.body(.body1), color: .gray100)
                .padding(.vertical, 13)
                .padding(.trailing, 11)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray500, lineWidth: 0.5)
        )
    }
}
#Preview {
    ZStack {
        Color.gray600
        LocationButton(text: "대마고")
    }
}
