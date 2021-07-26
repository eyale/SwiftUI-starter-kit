//
//  SettingsVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/24/21.
//

import SwiftUI

struct SettingsVC: View {
  @StateObject var viewModel = AuthenticationVM()
  @State private var isLogoutAlert = false

  var body: some View {
    VStack {
      ForEach(SettingsItems, id: \.self) { item -> SettingsListItem in
        SettingsListItem(element: item)
      }

      Spacer()
      Button(action: {
        isLogoutAlert = true
      }, label: {
        Text("Logout")
      })
      .buttonStyle(CustomButtonStyle(.rounded(type: .primary), isFullWidth: true))
      .padding(.horizontal, 20)
      .alert(isPresented: $isLogoutAlert) {
        Alert(title: Text("Please confirm Logout"),
              message: Text("We will miss you. We mean it."),
              primaryButton: .default(Text("Confirm")) {
                viewModel.signOut()
              },
              secondaryButton: .cancel())
      }
    }
    .padding(.top, 40)
    .padding(.bottom, 20)

  }
}


enum SettingsList {
  case termsAndConditions

  @ViewBuilder
  func destinationView(item: SettingsList) -> some View {

    switch self {
    case .termsAndConditions: TermsAndConditionsVC()
    }

  }
}

struct SettingsItem: Hashable {
  var iconName: String
  var title: String
  var viewControllerName: SettingsList
}

let SettingsItems = [
  SettingsItem(iconName: "scroll",
               title: "Terms and Conditions",
               viewControllerName: .termsAndConditions)
]

struct SettingsListItem: View {
  var element: SettingsItem


  var body: some View {
    switch element.viewControllerName {
    case .termsAndConditions:
      NavigationLink(destination:  TermsAndConditionsVC()) {
        VStack{
          HStack {
            Image(systemName: element.iconName)
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(RemoteConfigVM.shared.color(for: .primaryColor))
            Text(element.title).paragraph(weight: .semiBold, size: 18)

            Spacer()
          }
          .padding(.horizontal, 20)
          Divider().background(RemoteConfigVM.shared.color(for: .primaryColor))

        }
      }

    }
  }
}
