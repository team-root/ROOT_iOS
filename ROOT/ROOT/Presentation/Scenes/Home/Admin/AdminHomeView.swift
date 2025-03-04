import SwiftUI

struct AdminHomeView: View {
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
                VStack(alignment: .leading, spacing: .zero) {
                    Text("QR CODE")
                        .rootFont(.heading(.heading6), color: .gray100)
                        .padding(.top, 17)
                        .padding(.bottom, 26)
                    Button(action: {}) {
                        HStack(alignment: .center, spacing: 0) {
                            Image("volunteer")
                                .padding(19)
                            
                            Text("학생이 QR을 찍으면\n자동으로 다른 QR로 변경됩니다!")
                                .rootFont(.body(.body4), color: .gray100)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .background(Color.gray550)
                    .cornerRadius(10)
                    .padding(.horizontal, 2)
                    
                    ZStack {
                        GeometryReader { geometry in
                            let size = geometry.size.width
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray550)
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                    Rectangle()
                                        .fill(Color.main200)
                                        .frame(width: 0.34, height: size - 50)
                                        .position(x: size / 2, y: size / 2)
                                )
                                .overlay(
                                    Rectangle()
                                        .fill(Color.main200)
                                        .frame(width: size - 50, height: 0.34)
                                        .position(x: size / 2, y: size / 2)
                                )
                                .overlay(
                                    Button(action: {}) {
                                        Text("QR 생성하기")
                                            .rootFont(.body(.body3), color: .gray700)
                                            .padding(.vertical, 13)
                                            .padding(.horizontal, 27)
                                    }
                                    .background(Color.main200)
                                    .cornerRadius(15),
                                    alignment: .center
                                )
                        }
                    }
                    .padding(.top, 17)
                    
                    Spacer()
                }
                .padding(.horizontal, 22)
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
            .toolbar(clickAlertButton ? .hidden : .visible, for: .tabBar)
        }
    }
}

#Preview {
    AdminHomeView()
}
