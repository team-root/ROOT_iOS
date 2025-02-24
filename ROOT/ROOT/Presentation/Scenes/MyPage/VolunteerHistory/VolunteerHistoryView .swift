import SwiftUI

struct VolunteerHistoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray600
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("봉사 활동 내역")
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
            .toolbarBackground(Color.gray600, for: .navigationBar)
        }
    }
}

#Preview {
    VolunteerHistoryView()
}
