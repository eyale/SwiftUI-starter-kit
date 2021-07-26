//
//  UIColor+extension.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/16/21.
//

import SwiftUI

/**
 Controls Application colors.

 - parameter ColorNames: contains set of color palette taht used in Application.
 - warning: `RCValueNames` uses `ColorNames` enum to control app color palette
 */

enum ColorNames: String {
  case tintColor

  case primaryColor
  case secondaryColor
  case foregroundColor
  case foregroundDarkModeColor

  case backgroundColor
  case backgroundDarkModeColor

  case errorColor
  case warningColor
  case successColor

  case google = "Google"
}

// MARK: - Exposing ColorNames for initial Values in `RemoteConfigVM`
extension Color {
  static let tint = Color(ColorNames.tintColor.rawValue)
  static let primary = Color(ColorNames.primaryColor.rawValue)
  
  static let secondary = Color(ColorNames.secondaryColor.rawValue)
  static let foreground = Color(ColorNames.foregroundColor.rawValue)
  static let foregroundDarkModeColor = Color(ColorNames.foregroundDarkModeColor.rawValue)

  static let background = Color(ColorNames.backgroundColor.rawValue)
  static let backgroundDarkModeColor = Color(ColorNames.backgroundDarkModeColor.rawValue)
  
  static let success = Color(ColorNames.successColor.rawValue)
  static let warning = Color(ColorNames.warningColor.rawValue)
  static let error = Color(ColorNames.errorColor.rawValue)

  static let google = Color(ColorNames.google.rawValue)
}

// based on https://stackoverflow.com/a/56874327
/// Converting `hex` to Color
extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }

    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue:  Double(b) / 255,
      opacity: Double(a) / 255
    )
  }

// MARK: - From Color to UIColor
  func uiColor() -> UIColor {
    if #available(iOS 14.0, *) {
      return UIColor(self)
    }

    let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
    var hexNumber: UInt64 = 0
    var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

    let result = scanner.scanHexInt64(&hexNumber)
    if result {
      r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
      g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
      b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
      a = CGFloat(hexNumber & 0x000000FF) / 255
    }
    return UIColor(red: r, green: g, blue: b, alpha: a)
  }
}

// MARK: - From UIColor to String
extension UIColor {
  var hexString: String {
    let cgColorInRGB = cgColor.converted(to: CGColorSpace(name: CGColorSpace.sRGB)!, intent: .defaultIntent, options: nil)!
    let colorRef = cgColorInRGB.components
    let r = colorRef?[0] ?? 0
    let g = colorRef?[1] ?? 0
    let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
    let a = cgColor.alpha

    var color = String(
      format: "#%02lX%02lX%02lX",
      lroundf(Float(r * 255)),
      lroundf(Float(g * 255)),
      lroundf(Float(b * 255))
    )

    if a < 1 {
      color += String(format: "%02lX", lroundf(Float(a * 255)))
    }

    return color
  }
}
