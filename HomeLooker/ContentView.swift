//
//  ContentView.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 13/02/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
  var body: some View {
    VStack {
      HomeView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CameraView()
  }
}
