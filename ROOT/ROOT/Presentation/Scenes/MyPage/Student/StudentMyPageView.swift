import SwiftUI

struct StudentMyPageView: View {
    @State private var clickAlertButton: Bool = false
    @State private var clickHistoryButton: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray600
                    .ignoresSafeArea()
                NavigationLink(isActive: $clickAlertButton) {
                    AlertView()
                } label: {
                    EmptyView()
                }
                NavigationLink(isActive: $clickHistoryButton) {
                    VolunteerHistoryView()
                } label: {
                    EmptyView()
                }
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("1316 하원")
                            .rootFont(.heading(.heading4), color: .gray100)
                        Text("교실 분리수거")
                            .rootFont(.body(.body1), color: .gray300)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 10)
                    TotalVolunteerTimeView()
                        .padding(.vertical, 25)
                    MyPageButton(
                        text: "봉사 활동 내역 조회",
                        textColor: .gray100,
                        action: { clickHistoryButton = true }
                    )
                    MyPageButton(
                        text: "로그아웃",
                        textColor: .error,
                        action: {}
                    )
                    .padding(.top, 10)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("마이페이지")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        clickAlertButton = true
                        print("alert button")
                    }) {
                        Image("bell")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    StudentMyPageView()
}
