//
//  InitialScreenVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import SwiftIcons

struct InitialScreenVC: View {
  @State private var username: String = ""
  @State private var password: String = ""

  @StateObject var viewModel = AuthenticationVM()
  @State private var user = Auth.auth().currentUser

  var body: some View {
    NavigationView {
      if user == nil {
        LoginVC()
      } else {
        LoggedInVC(viewRouter: ViewRouter())
      }
    }
    .onAppear {
      NotificationCenter.default.addObserver(forName: NSNotification.Name("SIGNIN"),
                                             object: nil,
                                             queue: .main) { _ in
        self.user = Auth.auth().currentUser
      }
    }
  }
}
