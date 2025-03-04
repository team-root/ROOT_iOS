import SwiftUI

struct AdminMyPageView: View {
    @State private var clickAlertButton: Bool = false
    @State private var showingLogoutAlert = false
    let roles = ["교실 분리수거", "교실", "등등"]

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
                VStack(alignment: .leading, spacing: 50) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("선생님")
                            .rootFont(.heading(.heading4), color: .gray100)
                        List {
                            ForEach(roles, id: \.self) { role in
                                Text(role)
                                    .rootFont(.body(.body1), color: .gray300)
                                    .padding(.vertical, 2)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(.hidden)
                                    .listRowSpacing(-10)
                                    .listRowBackground(Color.gray600)
                            }
                        }
                        .listStyle(.plain)
                        .environment(\.defaultMinListRowHeight, 0)
                        .frame(height: CGFloat(roles.count) * CGFloat(24))
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 10)
                    MyPageButton(
                        text: "로그아웃",
                        textColor: .error,
                        action: { showingLogoutAlert = true }
                    )
                    .padding(.top, 10)
                    Spacer()
                }
                .padding(.horizontal, 20)
                if showingLogoutAlert {
                    LogoutAlertView(isPresent: $showingLogoutAlert)
                        .transition(.opacity)
                        .zIndex(1)
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
            .toolbar(clickAlertButton ? .hidden : .visible, for: .tabBar)
        }
    }
}

#Preview {
    AdminMyPageView()
}
