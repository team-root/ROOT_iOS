import SwiftUI

struct VolunteerHistoryView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray600
                    .ignoresSafeArea()
                VStack {
                    TotalVolunteerTimeView(time: 100)
                        .padding(.top, 20)
                        .padding(.bottom, 17)
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(0..<6, id: \.self) { _ in
                                Button(action: {}) {
                                    HStack {
                                        Text("활동 내용")
                                            .rootFont(.body(.body3), color: .gray100)
                                            .padding(.vertical, 20)
                                            .padding(.leading, 20)
                                        Spacer()
                                        Text("+\(16)")
                                            .rootFont(.body(.body3), color: .main100)
                                            .padding(.trailing, 20)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(.gray550)
                                    .cornerRadius(10)
                                    .disabled(true)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("봉사 활동 내역")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
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
    VolunteerHistoryView()
}
