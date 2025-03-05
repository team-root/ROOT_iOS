import SwiftUI

struct ScheduleView: View {
    @State private var clickAlertButton: Bool = false

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
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("일정 확인")
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
    ScheduleView()
}
