//
//  Helpers.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/6/21.
//

import Foundation

class Helpers {
  static func logProcessInformation() {
    for (key, value) in ProcessInfo.processInfo.environment {
      print("\n\(key): \(value)")
    }
  }
}
