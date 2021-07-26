//
//  ViewRouter.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/18/21.
//

import SwiftUI

/**
 Controls `CustomTabBar` content

 - parameter currentPage: @Published
 - returns: one of enum `Page`
 - warning:

 # Notes: #
 1. remember to change in `ViewRouter` file and wherever you invoke in current project this is `CustomTabBar`
 */


class ViewRouter: ObservableObject {
  @Published var currentPage: Page = .home
}

enum Page {
  case home
  case booking
  case components
  case map
  case settings
}

struct TabItem: Hashable {
  var iconName: String
  var title: String
  var page: Page
}

let TabItems = [TabItem(iconName: "homekit", title:"Home", page: .home),
                TabItem(iconName: "pencil.tip.crop.circle", title:"Booking", page: .booking),
                TabItem(iconName: "puzzlepiece", title:"Components", page: .components),
                TabItem(iconName: "map", title:"Map", page: .map),
                TabItem(iconName: "hammer", title:"Settings", page: .settings)]
