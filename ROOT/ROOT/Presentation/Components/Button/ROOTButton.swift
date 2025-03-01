import SwiftUI

struct ROOTButton: View {
    let title: String
    var isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .rootFont(.body(.body1))
                .foregroundColor(isEnabled ? Color.white : Color.gray400)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 19)
        }
        .background(isEnabled ? .main200 : .gray400)
        .cornerRadius(10)
        .disabled(!isEnabled)
    }
}

#Preview {
    ROOTButton(title: "Dsdsds", isEnabled: true, action: {})
}

