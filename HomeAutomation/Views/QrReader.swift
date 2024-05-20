//
//  QrReader.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 5/5/24.
//

//import SwiftUI
//
//struct QrReader: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    QrReader()
//}
import SwiftUI
import AVFoundation


//struct QRCodeScannerView: View {
//    var body: some View {
//        Text("QR Code Scanner") // Placeholder text for preview
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .cornerRadius(10)
//    }
//}
struct QRCodeScannerView: View {
    var body: some View {
        // Create a QR code scanner view
        QRCodeScanner()
    }
}

struct QRCodeScanner: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<QRCodeScanner>) -> UIViewController {
        // Create a QR code scanner
        let scannerViewController = QRCodeScannerViewController()
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<QRCodeScanner>) {
        // Update the view controller
    }
}

class QRCodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    let captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the capture session
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let input = try? AVCaptureDeviceInput(device: captureDevice!)
        captureSession.addInput(input!)

        // Set up the metadata output
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]

        // Initialize videoPreviewLayer here
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)

        // Start the capture session
        captureSession.startRunning()
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Your metadata handling code here
    }
}
#Preview {
    QRCodeScannerView()
}
