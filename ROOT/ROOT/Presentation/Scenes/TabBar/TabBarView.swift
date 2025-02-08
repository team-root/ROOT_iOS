import SwiftUI

struct TabBarView: View {
    @State private var selection = 2

    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .gray600

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            QRView()
                .tabItem {
                    Image(.qr)
                        .renderingMode(.template)
                }
                .tag(1)
            StudentHomeView()
                .tabItem {
                    Image(.home)
                        .renderingMode(.template)
                }
                .tag(2)
            ScheduleView()
                .tabItem {
                    Image(.calender)
                        .renderingMode(.template)
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    Image(.person)
                        .renderingMode(.template)
                }
                .tag(4)
        }
        .accentColor(.main100)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray400)
                .offset(y: -49)
            , alignment: .bottom
        )
    }
}

#Preview {
    TabBarView()
}
