//
//  Avatar.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI
import Firebase

struct Avatar: View {
  @State private var user = Auth.auth().currentUser
  var width: CGFloat
  var height: CGFloat

  init(width: CGFloat = 50, height: CGFloat = 50) {
    self.width = width
    self.height = height
  }
  

  var body: some View {
    VStack {
      if let avatarURL = user?.photoURL,
         let avatar = String(describing: avatarURL) {

        AsyncImage(url: URL(string: avatar)!,
                   placeholder: { Text("Loading ...").paragraph() },
                   image: { Image(uiImage: $0).resizable() })
          .avatar(width: width, height: height)
          .frame(width: width, height: height)

      } else {
        Image(systemName: "person.crop.circle")
          .avatarSystem()
      }
    }
    .padding()

  }
}
