import SwiftUI

struct AlertView: View {
    @Binding var returnToHome: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray600)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        ForEach(0..<10, id: \.self) { _ in
                            VStack(alignment: .leading, spacing: 8) {
                                Text("환경 지킴이 활동")
                                    .rootFont(.body(.body3), color: .gray100)
                                    .padding(.bottom, 10)
                                
                                Text("환경 지킴이 활동 짼 시키들 당장 내려와서 활동 진행하세요")
                                    .rootFont(.caption(.caption2), color: .gray100)
                                    .padding(.bottom, 15)
                            }
                            .padding(.horizontal, 37)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color.gray500)
                                    .padding(.horizontal, 20),
                                alignment: .bottom
                            )
                        }
                    }
                    .padding(.top, 27)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("알림")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        returnToHome = false
                    }) {
                        Image("back")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.gray600, for: .navigationBar)
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    AlertView(returnToHome: .constant(false))
}
