//
//  CameraPreview.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 17/02/23.
//

import Foundation
import PhotosUI
import SwiftUI

struct CameraPreview: UIViewRepresentable {
  @ObservedObject var cameraViewModel: CameraViewModel

  func makeUIView(context: Context) -> some UIView {
    let view = UIView(frame: UIScreen.main.bounds)
    cameraViewModel.preview = AVCaptureVideoPreviewLayer(session: cameraViewModel.session)
    cameraViewModel.preview.frame = view.frame
    cameraViewModel.preview.videoGravity = .resizeAspectFill
    view.layer.addSublayer(cameraViewModel.preview)
    cameraViewModel.session.startRunning()
    return view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
  }
}
