//
//  TextField+extension.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/22/21.
//

import SwiftUI

extension TextField {
  func standartUI() -> some View {
    self
      .padding(10)
      .font(.custom(CustomFont.regular.rawValue, size: 14))
      .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.foreground, lineWidth: 1))

  }
}
