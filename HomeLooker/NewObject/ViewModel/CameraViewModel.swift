//
//  CameraViewModel.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 17/02/23.
//

import Foundation
import PhotosUI
import SwiftUI

final class CameraViewModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
  @Published var session: AVCaptureSession
  @Published var output: AVCapturePhotoOutput
  @Published var preview: AVCaptureVideoPreviewLayer
  @Published var photoData: Data?
  @Published var isTaken: Bool = true
  @Published var alert: Bool = false
  @Published var isSaved: Bool = false

  override init() {
    session = AVCaptureSession()
    output = AVCapturePhotoOutput()
    preview = AVCaptureVideoPreviewLayer()
  }

  func checkCameraAccessAuthorization() {
    switch AVCaptureDevice.authorizationStatus(for: .video){
    case .authorized:
      setUp()
      return
    case .notDetermined:
      AVCaptureDevice.requestAccess(for: .video) { status in
        if status {
          self.setUp()
        }
      }
    case .denied:
      self.alert.toggle()
      return
    default:
      return
    }
  }

  func setUp() {
    do {
      self.session.beginConfiguration()
      guard let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) else {
        //TODO: - SHOW ERROR ALERT
        return
      }
      let input = try AVCaptureDeviceInput(device: device)

      if self.session.canAddInput(input) {
        self.session.addInput(input)
      }

      if self.session.canAddOutput(self.output) {
        self.session.addOutput(self.output)
      }

      self.session.commitConfiguration()
    }
    catch {
      // TODO: SHOW ERROR ALERT
      print(error.localizedDescription)
    }
  }

  func takePhoto() {
    DispatchQueue.global(qos: .background).async {
      self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
      self.session.stopRunning()
      DispatchQueue.main.async {
        withAnimation {
          self.isTaken.toggle()
        }
      }
    }
  }


  func retakePhoto() {
    DispatchQueue.global(qos: .background).async {
      self.session.startRunning()
      DispatchQueue.main.async {
        withAnimation {
          self.isTaken.toggle()
        }
        self.isSaved = false
      }
    }
  }

  func savePhoto() {
    if let data: Data = self.photoData, let image: UIImage = UIImage(data: data) {
      UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
      self.isSaved = true
    } else {
      //TODO: HANDLING ERROR
    }
  }

  // MARK: - AVCapturePhotoCapture Delegate Method
  func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
    if error != nil {
      // TODO: SHOW ERROR ALERT
      return
    }
    print("Pic taken!")
    guard let imageData = photo.fileDataRepresentation() else { return }
    self.photoData = imageData
  }
}
