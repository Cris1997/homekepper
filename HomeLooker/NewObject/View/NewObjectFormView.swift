//
//  NewObjectFormView.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 14/02/23.
//

import SwiftUI
import TextView

struct NewObjectFormView: View {
  @State var title: String = ""
  @State var description: String = ""
  @State var location: String = ""
  @State var data: Data?

  var body: some View {
    ZStack {
      Image("ObjectsBackground")
        .resizable()
        .ignoresSafeArea()
      VStack {
        titleTextFieldView
        locationView
        descriptionView
        if let data = data, let uiImage = UIImage(data: data) {
          Image(uiImage: uiImage)
            .resizable()
        }
        ImagePickerView(data: $data)
        Spacer()
      }
      .navigationBarTitle("Nuevo objeto")
      .navigationBarTitleDisplayMode(.large)
      .padding()
    }
  }

  var titleTextFieldView: some View {
    TextField("Nombre", text: $title)
      .padding(10)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 1)
          .foregroundColor(Color(.gray))
      )
  }

  var descriptionView: some View {
    TextView($description)
      .placeholder("Descripción") { view in
        view.foregroundColor(.gray)
      }
      .padding(10)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 1)
          .foregroundColor(Color(.placeholderText))
      )
  }

  var locationView: some View {
    TextField("Ubicación dentro de la casa", text: $location)
      .padding(10)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 1)
          .foregroundColor(Color(.gray))
      )
  }
}

struct NewObjectFormView_Previews: PreviewProvider {
  static var previews: some View {
    NewObjectFormView()
  }
}
