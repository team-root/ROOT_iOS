import SwiftUI

struct AdminTabBarView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .gray600
        appearance.shadowColor = .gray400

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView() {
            AdminHomeView()
                .tabItem {
                    Image(.home)
                        .renderingMode(.template)
                }
                .tag(1)
            ScheduleView()
                .tabItem {
                    Image(.calender)
                        .renderingMode(.template)
                }
                .tag(2)
            AdminMyPageView()
                .tabItem {
                    Image(.person)
                        .renderingMode(.template)
                }
                .tag(3)
        }
        .accentColor(.main100)
        .navigationBarHidden(true)
    }
}

#Preview {
    AdminTabBarView()
}
