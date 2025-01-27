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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 343, height: 57)
        .background(isEnabled ? .main200 : .gray400)
        .cornerRadius(10)
        .disabled(!isEnabled)
    }
}

