import SwiftUI
import CoreImage.CIFilterBuiltins

struct AdminHomeView: View {
    @State private var clickAlertButton: Bool = false
    @State private var clickQrButton: Bool = false
    @State private var inputText: String = "123"
    
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
                    
                    descriptionButton()
                    
                    qrCodeSection()
                    
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
                    }) {
                        Image("bell")
                    }
                }
            }
            .toolbar(clickAlertButton ? .hidden : .visible, for: .tabBar)
        }
    }
    
    private func descriptionButton() -> some View {
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
    }
    
    private func qrCodeSection() -> some View {
        ZStack {
            GeometryReader { geometry in
                let size = min(geometry.size.width, geometry.size.height)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray550)
                    .frame(width: size, height: size)
                    .overlay(qrCodeOverlay(size: size))
            }
        }
        .padding(.top, 17)
    }
    
    @ViewBuilder
    private func qrCodeOverlay(size: CGFloat) -> some View {
        if clickQrButton {
            if let qrImage = generateQRCode(from: inputText) {
                Image(uiImage: qrImage)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: size * 0.8, height: size * 0.8)
                    .padding(20)
            }
        } else {
            Rectangle()
                .fill(Color.main200)
                .frame(width: 0.5, height: size - 50)
                .position(x: size / 2, y: size / 2)
            Rectangle()
                .fill(Color.main200)
                .frame(width: size - 50, height: 0.5)
                .position(x: size / 2, y: size / 2)
            
            Button(action: {
                clickQrButton = true
            }) {
                Text("QR 생성하기")
                    .rootFont(.body(.body3), color: .gray700)
                    .padding(.vertical, 13)
                    .padding(.horizontal, 27)
            }
            .background(Color.main200)
            .cornerRadius(15)
        }
    }
}

private func generateQRCode(from string: String) -> UIImage? {
    guard !string.isEmpty, let data = string.data(using: .utf8) else { return nil }
    
    let filter = CIFilter.qrCodeGenerator()
    filter.setValue(data, forKey: "inputMessage")
    
    if let outputImage = filter.outputImage {
        let context = CIContext()
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
    }
    return nil
}

#Preview {
    AdminHomeView()
}
