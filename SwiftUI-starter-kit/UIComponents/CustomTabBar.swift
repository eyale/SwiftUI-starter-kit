//
//  CustomTabBar.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/18/21.
//

import SwiftUI
import Combine

struct CustomTabBar: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @StateObject var viewRouter: ViewRouter
  var geometry: GeometryProxy

  let tabbarHeight: CGFloat = 80
  let iconSize: CGFloat = 20

  var body: some View {
    VStack {
      NetworkTip()

      HStack {
        ForEach(TabItems, id: \.self) { item -> TabBarItem in
          TabBarItem(viewRouter: viewRouter,
                     assignedPage: item.page,
                     width: geometry.size.width / 5,
                     height: iconSize,
                     iconName: item.iconName,
                     tabName: item.title)
        }
      }
      .frame(width: geometry.size.width,
             height: tabbarHeight,
             alignment: .center)
      .background(colorScheme == .dark
                    ? RemoteConfigVM.shared.color(for: .backgroundDarkModeColor)
                    : RemoteConfigVM.shared.color(for: .backgroundColor))
      .padding(.top, -10)
    }
    .background(Color.red)
  }
}

struct TabBarItem: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @StateObject var viewRouter: ViewRouter
  let assignedPage: Page

  var colorDependOnMode: Color {
    colorScheme == .dark
      ? RemoteConfigVM.shared.color(for: .foregroundDarkModeColor)
      : RemoteConfigVM.shared.color(for: .foregroundColor) }
  var assignedPageColor: Color {
    viewRouter.currentPage == assignedPage
      ? colorDependOnMode
      : colorDependOnMode.opacity(0.5)
  }

  let width, height: CGFloat
  let iconName, tabName: String

  var body: some View {
    VStack {
      Image(systemName: iconName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: width, height: height)
        .foregroundColor(assignedPageColor)

      Text(tabName)
        .tabbar(color: assignedPageColor)
    }
    .padding(.horizontal, -5)
    .onTapGesture {
      viewRouter.currentPage = assignedPage
    }
  }
}
