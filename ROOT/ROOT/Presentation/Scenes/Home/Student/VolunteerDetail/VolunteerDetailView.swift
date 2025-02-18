import SwiftUI

struct VolunteerDetailView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray600)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 5) {
                    Text("환경지킴이 활동")
                        .rootFont(.heading(.heading5), color: .gray100)
                    Text("환경을 정화하는 활동입니다.")
                        .rootFont(.body(.body4), color: .gray100)
                        .padding(.bottom, 32)
                    
                    HStack(spacing: 13) {
                        VStack(spacing: 15) {
                            VolunteerInfoView(
                                title: "신청 기간",
                                content: "2024.12.19 ~\n2024.12.22",
                                icon: "calender2"
                            )
                            VolunteerInfoView(
                                title: "봉사 시간",
                                content: "8시간",
                                icon: "time"
                            )
                        }
                        VStack(spacing: 13) {
                            VolunteerInfoView(
                                title: "활동 기간",
                                content: "2024.12.19 ~\n2024.12.22",
                                icon: "calender2"
                            )
                            VolunteerInfoView(
                                title: "봉사 인원",
                                content: "20명",
                                icon: "people"
                            )
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 25)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("봉사 활동")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                    }) {
                        Image("back")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    VolunteerDetailView()
}
