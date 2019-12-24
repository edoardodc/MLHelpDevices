//  Created by Edoardo de Cal on 10/12/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, ButtonsDelegate {
    

//    let buttonConfirm = CustomButton(frame: .zero, backgroundColor: #colorLiteral(red: 0.00169262616, green: 0.5661305189, blue: 0.9979987741, alpha: 1))
    let searchingView = SearchingView()
    let bottomView = BottomView()
    var deviceName = ""
    var selectedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCameraCaptureSession()
        showBottomView(text: "Esempio")
        addSearchingDeviceView()
    }
    
    func setupCameraCaptureSession() {
        let captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice ) else { return }
        captureSession.addInput(input)
        captureSession.startRunning()
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        let dataOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(dataOutput)
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        guard let model = try? VNCoreMLModel(for: HandImagesClassifier().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, error) in
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            if firstObservation.confidence > 0.95 {
                print(firstObservation.identifier, firstObservation.confidence)
                DispatchQueue.main.async {
                    self.searchingView.setText(text: String(firstObservation.identifier))
                    self.deviceName = firstObservation.identifier
                }
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
    func showBottomView(text: String) {
        bottomView.delegate = self
        view.addSubview(bottomView)
        bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    func addSearchingDeviceView() {
        view.addSubview(searchingView)
        searchingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        buttonConfirm.setTitle("Confirm", for: .normal)
//        buttonConfirm.addTarget(self, action: #selector(buttonConfirmTapped), for: .touchUpInside)
//        view.addSubview(buttonConfirm)
//        buttonConfirm.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        buttonConfirm.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        buttonConfirm.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        buttonConfirm.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func buttonConfirmTapped() {
//        buttonConfirm.alpha = 0
        searchingView.alpha = 0
        showBottomView(text: deviceName)
        selectedName = deviceName
    }
    
    func didTapBuyButton() {
        let vc = DetailDeviceViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    func didTapCloseButton() {
//        buttonConfirm.alpha = 1
        searchingView.alpha = 1
        bottomView.removeFromSuperview()
        selectedName = deviceName
    }

}

