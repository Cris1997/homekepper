//
//  HomeView.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 13/02/23.
//
import Lottie
import SwiftUI

struct HomeView: View {
  @State var object: String = ""

  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(colors: [Color("Color1"), Color("Color2")], startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack(alignment: .center, spacing: 20) {
          LottieView(name: "owl")
            .frame(width: 250, height: 250, alignment: .center)
          Text("¿Qué estás buscando?")
            .font(.system(size: 25))
            .foregroundColor(.white)
            .fontWeight(.semibold)
          TextField("Tijeras", text: $object)
            .textFieldStyle(.roundedBorder)
            .font(.system(size: 20))
            .foregroundColor(.black)
            .padding()
            .frame(width: 225, height: 50.0, alignment: .center)
          HStack(spacing: 20) {
            NavigationLink {
              NewObjectFormView()
            } label: {
              Image(systemName: "plus")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color("Button"))
                .cornerRadius(50)
                .padding()
            }
            Button {

            } label: {
              Image(systemName: "archivebox.fill")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color("Button"))
                .cornerRadius(50)
                .padding()
            }
          }
        }
      }
    }
    .navigationBarHidden(true)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
