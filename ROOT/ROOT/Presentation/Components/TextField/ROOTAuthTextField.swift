import SwiftUI

struct ROOTAuthTextField: View {
    @Binding var title: String
    @Binding var text: String
    @Binding var placeholder: String
    @Binding var error: String
    
    public init(
        title: Binding<String>,
        text: Binding<String>,
        placeholder: Binding<String>,
        error: Binding<String>
    ) {
        _title = title
        _text = text
        _placeholder = placeholder
        _error = error
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .rootFont(.caption(.caption3))
                .foregroundStyle(.gray100)

            ZStack(alignment: .leading) {
                if placeholder.isEmpty {
                    Text(text)
                        .rootFont(.caption(.caption3))
                        .foregroundStyle(.gray500)
                }
                TextField("", text: $placeholder)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(16)
                    .rootFont(.body(.body4))
                    .foregroundStyle(.gray100)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray550)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray300, lineWidth: 1)
                            )
                    )
            }

            Text(error)
                .rootFont(.caption(.caption4))
                .foregroundStyle(.error)
                .hidden()
        }
        .padding(.horizontal, 24)
    }
}

struct DMSFormTextField_Previews: PreviewProvider {
    static var previews: some View {
        ROOTAuthTextField(
            title: .constant("아이디"),
            text: .constant(""),
            placeholder: .constant("아이디를 입력해주세요."),
            error: .constant("존재하지 않는 아이디 입니다"))
    }
}
