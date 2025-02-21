import SwiftUI

struct RoleListView: View {
    let roles: [String]
    var body: some View {
        FlowLayout(spacing: 8) {
            ForEach(roles, id: \.self) { role in
                Text(role)
                    .rootFont(.caption(.caption1), color: .main100)
                    .padding(.horizontal, 10.5)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .stroke(Color.main200, lineWidth: 1)
                    )
            }
        }
    }
}

#Preview {
    ZStack {
        Color
            .gray600
        RoleListView(roles: ["역할1", "역할역할역할역할2", "역할역할3",
                            "역할역할역할역할역할역할4", "역할역할5", "역할6", "ㅇㄹㅁㄴㄹ", "ㄴㄹㄴ"])
    }
    
}
