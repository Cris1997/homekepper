//
//  ViewModel.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 16/02/23.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
  @Published var image: UIImage?
  @Published var showPicker = false
}
