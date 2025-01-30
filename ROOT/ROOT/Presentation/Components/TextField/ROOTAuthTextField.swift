import SwiftUI

struct ROOTAuthTextField: View {
    @Binding var title: String
    var placeholder: String
    @Binding var text: String
    @Binding var error: String
    @FocusState var isFocused: Bool
    
    public init(
        title: Binding<String>,
        text: Binding<String>,
        placeholder: String = "",
        error: Binding<String>
    ) {
        _title = title
        _text = text
        self.placeholder = placeholder
        _error = error
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .rootFont(.caption(.caption3))
                .foregroundStyle(.gray100)
            
            ZStack(alignment: .leading) {
                TextField("", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(16)
                    .rootFont(.body(.body4), color: .gray300)
                    .focused($isFocused)
                    .background(Color.gray550)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray500)
                    )
                    .onTapGesture {
                        isFocused = true
                    }
                if text.isEmpty {
                    Text(placeholder)
                        .rootFont(.body(.body4), color: Color.gray300)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                        .onTapGesture {
                            isFocused = true
                        }
                        .allowsHitTesting(false)
                }
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
            placeholder: "아이디를 입력해주세요.",
            error: .constant("존재하지 않는 아이디 입니다"))
    }
}
