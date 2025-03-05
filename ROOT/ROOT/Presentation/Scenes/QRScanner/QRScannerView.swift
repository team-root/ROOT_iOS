import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @State private var isShowingScanner = true
    @State private var showingPopUp = false
    
    var body: some View {
        ZStack {
            CodeScannerView(
                codeTypes: [.qr],
                simulatedData: "Some simulated data",
                completion: handleScan
            )
            if showingPopUp {
                ROOTPopUpView(
                    isPresent: $showingPopUp,
                    title: "출석 체크 완료!",
                    content: "출석 체크가 완료되었습니다."
                )
                .transition(.opacity)
                .zIndex(1)
            }
        }
    }
    
    private func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let scanResult):
            showingPopUp = true
        case .failure(let error):
            print("Failed Scan QR Code because of \(error)")
        }
    }
}

#Preview {
    QRScannerView()
}
