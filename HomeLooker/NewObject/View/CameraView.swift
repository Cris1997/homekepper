//
//  CameraVIew.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 17/02/23.
//

import SwiftUI

struct CameraView: View {
  @StateObject var cameraViewModel =  CameraViewModel()
  var body: some View {
    ZStack {
      CameraPreview(cameraViewModel: cameraViewModel)
        .ignoresSafeArea(.all, edges: .all)
      VStack {
        if cameraViewModel.isTaken {
          HStack {
            Spacer()
            Button {
              cameraViewModel.retakePhoto()
            } label: {
              Image(systemName: "arrow.triangle.2.circlepath.camera")
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            }
          .padding(.trailing, 10)
          }
        }
        Spacer()
        HStack {
          if cameraViewModel.isTaken {
            Button {
              if !cameraViewModel.isSaved {
                cameraViewModel.savePhoto()
              }
            } label: {
              Text(cameraViewModel.isSaved ? "Saved" : "Save")
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.white)
                .clipShape(Capsule())
            }
            .padding(.leading)

            Spacer()

          } else {
            Button {
              cameraViewModel.takePhoto()
            } label: {
              ZStack {
                Circle()
                  .fill(Color.white)
                  .frame(width: 65, height: 65)
                Circle()
                  .stroke(Color.white, lineWidth: 2)
                  .frame(width: 75, height: 75)
              }
            }
          }
        }
        .frame(height: 75)
      }
    }
    .onAppear() {
      cameraViewModel.checkCameraAccessAuthorization()
    }
  }
}
