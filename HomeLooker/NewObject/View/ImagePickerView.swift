//
//  ImagePickerView.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 16/02/23.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
  @State var selectedImage: [PhotosPickerItem]
  @Binding var data: Data?

  init(selectedImage: [PhotosPickerItem] = [], data: Binding<Data?>) {
    self.selectedImage = selectedImage
    self._data = data
  }

  var body: some View {
    VStack {
      Spacer()
      PhotosPicker(
        selection: $selectedImage,
        maxSelectionCount: 1,
        matching: .images
      ) {
         Image(systemName: "photo.on.rectangle.angled")
          .font(.system(size: 30))
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .padding()
          .background(Color("Color2"))
          .clipShape(Circle())
      }
      .onChange(of: selectedImage) { _ in
        guard let image = selectedImage.first else {
          return
        }
        image.loadTransferable(type: Data.self) { result in
          switch result {
          case .success(let data):
            if let data = data {
              self.data = data
            } else {
              print("Data is nil")
            }
          case .failure(let failure):
            fatalError("\(failure)")
          }
        }
      }
    }
  }
}
