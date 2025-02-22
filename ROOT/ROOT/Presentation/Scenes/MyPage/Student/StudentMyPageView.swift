import SwiftUI

struct StudentMyPageView: View {
    @State private var clickAlertButton: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray600
                    .ignoresSafeArea()
                NavigationLink(isActive: $clickAlertButton) {
                    AlertView(returnToHome: $clickAlertButton)
                } label: {
                    EmptyView()
                }
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("1316 하원")
                            .rootFont(.heading(.heading4), color: .gray100)
                        Text("교실 분리수거")
                            .rootFont(.body(.body1), color: .gray300)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                    TotalVolunteerTimeView()
                    Spacer()
                }
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
