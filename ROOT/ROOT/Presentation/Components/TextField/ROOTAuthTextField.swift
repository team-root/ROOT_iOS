import SwiftUI

struct ROOTAuthTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var error: String
    var isSecureField: Bool
    
    @FocusState private var isFocused: Bool
    @State private var isSecure: Bool
    
    public init(
        title: String = "",
        text: Binding<String>,
        placeholder: String = "",
        error: String = "",
        isSecureField: Bool = false
    ) {
        self.title = title
        _text = text
        self.placeholder = placeholder
        self.error = error
        self.isSecureField = isSecureField
        _isSecure = State(initialValue: isSecureField)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .rootFont(.caption(.caption3))
                .foregroundStyle(.gray100)
            
            ZStack {
                HStack {
                    if isSecure {
                        SecureField("", text: $text)
                            .textFieldStyle(PlainTextFieldStyle())
                            .rootFont(.body(.body4), color: .gray300)
                            .focused($isFocused)
                            .padding(.leading, 16)
                    } else {
                        TextField("", text: $text)
                            .textFieldStyle(PlainTextFieldStyle())
                            .rootFont(.body(.body4), color: .gray300)
                            .focused($isFocused)
                            .padding(.leading, 16)
                    }
                    
                    if isSecureField {
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(isSecure ? .eyeOff : .eyeOpen)
                                .foregroundColor(.gray300)
                                .padding(.trailing, 16)
                        }
                    }
                }
                .frame(height: 50)
                .background(Color.gray550)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray500)
                )
                
                if text.isEmpty {
                    Text(placeholder)
                        .rootFont(.body(.body4), color: Color.gray300)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
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

#Preview {
    VStack {
        ROOTAuthTextField(
            title: "아이디",
            text: .constant(""),
            placeholder: "아이디를 입력해주세요.",
            error: "존재하지 않는 아이디입니다",
            isSecureField: false
        )
        
        ROOTAuthTextField(
            title: "비밀번호",
            text: .constant(""),
            placeholder: "비밀번호를 입력해주세요.",
            error: "비밀번호가 일치하지 않습니다",
            isSecureField: true
        )
    }
}
