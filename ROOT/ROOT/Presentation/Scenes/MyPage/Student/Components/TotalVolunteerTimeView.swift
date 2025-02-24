import SwiftUI

struct TotalVolunteerTimeView: View {
    let time: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("총 봉사활동 시간")
                .rootFont(.caption(.caption2), color: .gray300)
            Text("\(time) 시간")
                .rootFont(.heading(.heading2), color: .gray100)
        }
        .padding(.vertical, 25)
        .padding(.leading, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray550)
        .cornerRadius(20)
    }
}

#Preview {
    TotalVolunteerTimeView(time: 100)
}
