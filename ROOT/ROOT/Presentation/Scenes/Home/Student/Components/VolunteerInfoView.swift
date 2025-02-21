import SwiftUI

struct VolunteerInfoView: View {
    let title: String
    let content: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: icon == "calender2" ? 11 : 17) {
            HStack {
                Image(icon)
                Text(title)
                    .rootFont(.caption(.caption3), color: .gray300)
            }
            Text(content)
                .rootFont(icon == "calender2" ? .caption(.caption2): .body(.body1), color: .gray100)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 11, leading: 13, bottom: icon == "calender2" ? 14 : 20, trailing: 13))
        .background(Color.clear)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray500, lineWidth: 0.5)
        )
    }
}

#Preview {
    ZStack {
        Color(.gray600)
            .ignoresSafeArea()
        VolunteerInfoView(title: "신청 기간", content: "어쩔래님", icon: "calender2")
    }
}
