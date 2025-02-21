import SwiftUI

struct StudentHomeView: View {
    @State private var clickAlertButton: Bool = false
    @State private var clickVolunteerButton: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(isActive: $clickAlertButton) {
                    AlertView(returnToHome: $clickAlertButton)
                } label: {
                    EmptyView()
                }
                NavigationLink(isActive: $clickVolunteerButton) {
                    VolunteerDetailView(returnToHome: $clickVolunteerButton)
                } label: {
                    EmptyView()
                }
                Color(.gray600)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("봉사 활동 신청")
                        .rootFont(.heading(.heading6), color: .gray100)
                        .padding(.leading, 22)
                        .padding(.top, 17)
                    Spacer().frame(height: 27)
                    
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(0..<10, id: \.self) { _ in
                                Button(action: {
                                    clickVolunteerButton = true
                                }) {
                                    HStack {
                                        Text("봉사 활동 제목")
                                            .rootFont(.body(.body4), color: .gray100)
                                            .padding(EdgeInsets(top: 26, leading: 20, bottom: 26, trailing: 20))
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray500, lineWidth: 0.5)
                                    )
                                    .padding(.horizontal, 20)
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("logo")
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
            .toolbar(clickAlertButton || clickVolunteerButton ? .hidden : .visible, for: .tabBar)
        }
    }
}

#Preview {
    StudentHomeView()
}
