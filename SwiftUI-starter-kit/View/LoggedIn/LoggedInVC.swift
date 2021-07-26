//
//  LoggedInVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import Combine

struct LoggedInVC: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @StateObject var viewRouter: ViewRouter
  @State private var user = Auth.auth().currentUser

  var body: some View {
    GeometryReader { geometry in
      VStack {
        switch viewRouter.currentPage {
        case .home:
          HomeVC()
        case .booking:
          BookingVC()
        case .components:
          ComponentsScreenVC()
        case .map:
          MapVC()
        case .settings:
          SettingsVC()
        }
        CustomTabBar(viewRouter: viewRouter,
                     geometry: geometry)
      }
      .edgesIgnoringSafeArea(.bottom)
      .frame(width: geometry.size.width,
             height: geometry.size.height,
             alignment: .bottom)
    }
    .onAppear{
      
      if let id = user?.uid {
        DevAnalytics.setUserID(userID: "\(id)")
      }

      DevAnalytics.logEvent(AnalyticEvents.sign_in.rawValue)

    }
    .navigationBarHidden(true)

  }
}
