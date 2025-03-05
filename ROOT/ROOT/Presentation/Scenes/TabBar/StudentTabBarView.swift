import SwiftUI

struct StudentTabBarView: View {
    @State private var selection = 2

    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .gray600
        appearance.shadowColor = .gray400

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            QRScannerView()
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
            StudentMyPageView()
                .tabItem {
                    Image(.person)
                        .renderingMode(.template)
                }
                .tag(4)
        }
        .accentColor(.main100)
        .navigationBarHidden(true)
    }
}

#Preview {
    StudentTabBarView()
}
