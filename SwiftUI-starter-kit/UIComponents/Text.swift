//
//  Text.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/16/21.
//

import SwiftUI

extension Text {
  func tabbar(color: Color = RemoteConfigVM.shared.color(for: .foregroundColor)) -> some View {
    self
      .modifier(CustomText(weight: .medium, size: 12))
      .foregroundColor(color)
  }
  
  func label() -> some View {
    self.modifier(CustomText(weight: .medium, size: 14))
  }

  func paragraph(weight: CustomFont = .medium,
                 size: CGFloat = 16) -> some View {
    self
      .modifier(CustomText(weight: weight, size: size))
      .lineLimit(nil)
  }
  
  func title() -> some View {
    self
      .modifier(CustomText(weight: .extraBold, size: 22))
      .padding(.vertical, 10)
  }
  func subtitle() -> some View {
    self
      .modifier(CustomText(weight: .bold, size: 18))
      .padding(.vertical, 5)
  }

  func navigationTitle() -> some View {
    self.modifier(CustomText(weight: .bold, size: 16))
  }

  func navigationSubtitle() -> some View {
    self.modifier(CustomText(weight: .semiBold, size: 14))
  }
  
}

struct CustomText: ViewModifier {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  let weight: CustomFont
  let size: CGFloat

  init(weight: CustomFont = .medium, size: CGFloat = 14) {
    self.weight = weight
    self.size = size
  }

  func body(content: Content) -> some View {
    let color: Color? = colorScheme == .dark
      ? RemoteConfigVM.shared.color(for: .foregroundDarkModeColor)
      : RemoteConfigVM.shared.color(for: .foregroundColor)

    let font: Font = .custom(weight.rawValue, size: size)
    return content
      .foregroundColor(color)
      .font(font)
  }
}
