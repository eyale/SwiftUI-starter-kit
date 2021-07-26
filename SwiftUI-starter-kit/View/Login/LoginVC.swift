//
//  LoginVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/16/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import SwiftIcons

struct LoginVC: View {
  @State private var username: String = ""
  @State private var password: String = ""

  @StateObject var viewModel = AuthenticationVM()
  @State private var user = Auth.auth().currentUser

  var body: some View {
    NavigationView {

      VStack {
        Image(ImageNames.logo)
          .resizable()
          .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .background(Color.background)
          .cornerRadius(65)

        VStack(alignment: .leading,
               spacing: 10,
               content: {
                Text("SwiftUI StarterKit")
                  .title()

                Text("Login")
                  .label()
                TextField("Login", text: $username)
                  .standartUI()

                Text("Password")
                  .label()
                TextField("Password", text: $password)
                  .standartUI()

                Button(action: {
                  //                    viewModel.signIn()
                }, label: {
                  Text("Login")
                })
                .buttonStyle(CustomButtonStyle(.rounded(type: .primary), isFullWidth: true))

               })

        Text("Or use").paragraph()

        Button(action: {
          viewModel.signIn()
        }, label: {
          HStack{
            Image(uiImage: UIImage(icon: .icofont(.socialGooglePlus),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))

            Text("Sign in with Google")
          }
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .google), isFullWidth: true))

        Spacer()
      }
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .padding(20)

    }
  }
}
