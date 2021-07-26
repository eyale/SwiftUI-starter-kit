//
//  HomeVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/17/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct HomeVC: View {
  @StateObject var viewModel = AuthenticationVM()
  @State private var user = Auth.auth().currentUser
  @State private var email = ""
  @State private var avatar = ""

  var body: some View {
    GeometryReader { geometry in
      VStack {
        if let email = user?.email,
           let name = user?.displayName {
          HStack {
            Avatar(width: 90, height: 90)
          }
          .frame(width: geometry.size.width,
                 alignment: .leading)
          HStack {
            Text(String(describing: "User: "))
              .paragraph(weight: .regular)
              .frame(width: 100, alignment: .leading)
            Text(String(describing: email))
              .paragraph()

          }
          .frame(width: geometry.size.width,
                 alignment: .leading)
          .padding(.bottom, 5)

          HStack {
            Text(String(describing: "Name: "))
              .paragraph(weight: .regular)
              .frame(width: 100, alignment: .leading)
            Text(String(describing: name))
              .paragraph()
          }
          .frame(width: geometry.size.width,
                  alignment: .leading)
          .padding(.bottom, 5)

          Spacer()
        }

      }
      .frame(width: geometry.size.width,
             height: geometry.size.height,
             alignment: .leading)
      .edgesIgnoringSafeArea(.bottom)
    }
    .padding(20)
    .onAppear {
      NotificationCenter
        .default
        .addObserver(forName: NSNotification.Name("SIGNIN"),
                     object: nil,
                     queue: .main) { _ in
          self.user = Auth.auth().currentUser
        }

    }


  }
}

//struct HomeVC_Previews: PreviewProvider {
//  static var previews: some View {
//      HomeVC()
//      .previewLayout(.sizeThatFits)
//
//  }
//}
