//
//  AuthenticationVM.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/18/21.
//

import Firebase
import GoogleSignIn

class AuthenticationVM: NSObject, ObservableObject {
  enum SignInState {
    case signedIn
    case signedOut
  }

  @Published var state:SignInState = .signedOut

  override init() {
    super.init()

    setupGoogleSignIn()
  }

  func signIn() {
    if GIDSignIn.sharedInstance().currentUser == nil {
      GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
      GIDSignIn.sharedInstance().signIn()
    }
  }

  func signOut()  {
    GIDSignIn.sharedInstance().signOut()
    print("state: ", state)

    do {
      try Auth.auth().signOut()

      state = .signedOut
      NotificationCenter.default.post(name: NSNotification.Name("SIGNIN"), object: nil)
    } catch let signOutError as NSError {
      print("\nGoogle sign OUT Error:\n", signOutError.localizedDescription, "\n")
    }
  }

  func setupGoogleSignIn() {
    GIDSignIn.sharedInstance().delegate = self
  }
}

extension AuthenticationVM: GIDSignInDelegate {
  func sign(_ signIn: GIDSignIn!,
            didSignInFor user: GIDGoogleUser!,
            withError error: Error!) {
    if error == nil {
      firebaseAuthentication(withUser: user)
    } else {
      print(error.debugDescription)
    }
  }

  private func firebaseAuthentication(withUser user: GIDGoogleUser) {
    if let authentication = user.authentication {
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                     accessToken: authentication.accessToken)

      Auth.auth().signIn(with: credential) { (result, error) in
        if let error = error {
          print(error.localizedDescription)
          print("\nGoogle sign in Error:\n", error.localizedDescription, "\n")
        } else {
          self.state = .signedIn
          NotificationCenter.default.post(name: NSNotification.Name("SIGNIN"), object: nil)
        }
      }
    }
  }
}
