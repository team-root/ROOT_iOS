import SwiftUI

struct StudentHomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray600)
                    .ignoresSafeArea()
                VStack {
                    Text("Home Screen")
                        .font(.largeTitle)
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        Image("logo")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image("bell")
                    }
                }
            }
        }
    }
}

#Preview {
    StudentHomeView()
}
