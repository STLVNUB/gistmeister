//
//  CodeScannerView.swift
//  Gist Meister
//
//  Created by Dennis on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import AVFoundation


class CodeScannerView: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // Interface outlets
    @IBOutlet weak var captureView: UIView!
    
    // Class variables
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var homeView: HomeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize AV Capture
        self.captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.captureView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        self.captureView.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            // Store QR code
            self.homeView?.viewModel.extractGistID(url: stringValue)
        }
        
        // Go to "Comment on Gist UIViewController" on completion
        dismiss(animated: true, completion: {
            self.homeView?.qrScannerSuccess()
        })
    }
    
    // MARK: - IB actions
    @IBAction func closeButtonPressed(_ sender: Any) {
        // No QR code scanned, just close the Popover
        dismiss(animated: true)
    }
}
