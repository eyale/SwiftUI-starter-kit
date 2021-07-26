//
//  BackButton.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI

struct BackButton: View {
  var presentationMode: Binding<PresentationMode>

  var body: some View {
    Button(action: {
      self.presentationMode.wrappedValue.dismiss()
    }) {
      HStack {
        Image(systemName: "chevron.left")
          .aspectRatio(contentMode: .fit)

        Text("Go Back").navigationSubtitle()
      }
    }
  }
}
