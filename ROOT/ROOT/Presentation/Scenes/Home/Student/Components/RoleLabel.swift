import SwiftUI

struct RoleLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .rootFont(.caption(.caption1), color: .main100)
            .padding(.horizontal, 10.5)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .stroke(Color.main200, lineWidth: 1)
            )
    }
}

#Preview {
    ZStack {
        Color
            .gray600
        RoleLabel(text: "역할")
    }
    
}
