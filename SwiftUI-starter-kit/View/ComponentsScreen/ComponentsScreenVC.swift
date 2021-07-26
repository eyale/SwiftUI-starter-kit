//
//  ComponentsVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/23/21.
//

import SwiftUI
import BeautyChart

struct ComponentsScreenVC: View {

  var body: some View {
    ScrollView {

      NavigationLink(destination: ButtonsVC()) {
        Text("Go to Buttons Screen")
      }
      .buttonStyle(CustomButtonStyle(.default(type: .primary), isFullWidth: true))

      NavigationLink(destination: FontsVC()) {
        Text("Go to Fonts Screen")
      }
      .buttonStyle(CustomButtonStyle(.default(type: .primary), isFullWidth: true))

      NavigationLink(destination: ChartsVC()) {
        Text("Go to Charts Screen")
      }
      .buttonStyle(CustomButtonStyle(.default(type: .primary), isFullWidth: true))

      NavigationLink(destination: PopupVC()) {
        Text("Popup Screen")
      }
      .buttonStyle(CustomButtonStyle(.default(type: .primary), isFullWidth: true))

      NavigationLink(destination: JokesScreenVC()) {
        Text("Jokes List fetched from server")
      }
      .buttonStyle(CustomButtonStyle(.default(type: .primary), isFullWidth: true))

    }
    
    .padding(20)
  }
}
