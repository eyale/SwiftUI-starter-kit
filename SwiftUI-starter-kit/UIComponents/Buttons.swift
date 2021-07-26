//
//  Buttons.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/23/21.
//

import SwiftUI

protocol ButtonStyleConfig {
  var foregroundColor: Color? { get }
  var backgroundColor: Color? { get }
  var borderColor: Color { get }
  var borderWidth: CGFloat { get }
  var cornerRadius: CGFloat { get }
}

extension ButtonStyleConfig {
  var borderColor: Color {
    Color.clear
  }
  
  var borderWidth: CGFloat {
    0
  }
  
  var cornerRadius: CGFloat {
    6
  }
}

protocol AccentColoured {
  static var primaryColor: Color?  { get }
  static var secondaryColor: Color? { get }
}

extension AccentColoured {
  static var secondaryColor: Color? {
    Color.white
  }
}

struct PrimaryStyleConfig: AccentColoured {
  static var primaryColor: Color? {
    RemoteConfigVM.shared.color(for: .primaryColor)
  }
}

struct SuccessStyleConfig: AccentColoured {
  static var primaryColor: Color? {
    RemoteConfigVM.shared.color(for: .successColor)
  }
}

struct InfoStyleConfig: AccentColoured {
  static var primaryColor: Color? {
    RemoteConfigVM.shared.color(for: .primaryColor).opacity(0.6)
  }
}

struct WarningStyleConfig: AccentColoured {
  static var primaryColor: Color? {
    RemoteConfigVM.shared.color(for: .warningColor)
  }
}

struct ErrorStyleConfig: AccentColoured {
  static var primaryColor: Color? {
    RemoteConfigVM.shared.color(for: .errorColor)
  }
}

struct GoogleStyleConfig: AccentColoured {
  static var primaryColor: Color? {
    return Color.google
  }
}

enum ButtonStyles {
  case primary, success, info, warning, error, google
  
  var secondaryColor: Color? {
    switch self {
      
    case .primary:
      return PrimaryStyleConfig.secondaryColor
      
    default:
      return Color.white
    }
  }
  
  var primaryColor: Color? {
    switch self {
    case .primary:
      return PrimaryStyleConfig.primaryColor
      
    case .success:
      return SuccessStyleConfig.primaryColor
      
    case .info:
      return InfoStyleConfig.primaryColor
      
    case .warning:
      return WarningStyleConfig.primaryColor
      
    case .error:
      return ErrorStyleConfig.primaryColor
      
    case .google:
      return GoogleStyleConfig.primaryColor
    }
  }
}

enum DisplayStyle: ButtonStyleConfig {

  case `default`(type: ButtonStyles = .primary)
  case transparent(type: ButtonStyles = .primary)
  case outline(type: ButtonStyles = .primary)
  case rounded(type: ButtonStyles = .primary)
  
  var foregroundColor: Color? {
    switch self {
    case .default(let type):
      return type.secondaryColor
      
    case .transparent(let type):
      return type.primaryColor
      
    case .outline(let type):
      return type.primaryColor
      
    case .rounded(let type):
      return type.secondaryColor
    }
  }
  
  var backgroundColor: Color? {
    switch self {
    case .default(let type):
      return type.primaryColor
      
    case .transparent(let type):
      return type.secondaryColor
      
    case .outline(let type):
      return type.secondaryColor
      
    case .rounded(let type):
      return type.primaryColor
    }
  }
  
  var borderColor: Color {
    if case .outline(let type) = self {
      return type.primaryColor ?? Color.clear
    }
    
    return Color.clear
  }
  
  var cornerRadius: CGFloat {
    if case .rounded(_) = self {
      return 40
    }
    
    return 6
  }
}

enum Size {
  case `default`, small, large
  
  func getFont() -> Font {
    switch self {
    case .small:
      return Font.custom(CustomFont.regular.rawValue, size: 14)
    case .large:
      return Font.custom(CustomFont.regular.rawValue, size: 20)
    default:
      return Font.custom(CustomFont.regular.rawValue, size: 16)
    }
  }
}

struct FullWidthModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
  }
}

struct CustomButtonStyle: ButtonStyle {
  @Environment(\.colorScheme) var colorScheme: ColorScheme

  private var isFullWidth: Bool
  
  private var display: DisplayStyle
  private var font: Font
  
  init(_ display: DisplayStyle = .default(type: .primary),
       size: Size = .default,
       isFullWidth: Bool = false) {
    
    self.display = display
    font = size.getFont()
    self.isFullWidth = isFullWidth
  }
  
  func makeBody(configuration: Self.Configuration) -> some View {
    let background: Color? = colorScheme == .dark && display.backgroundColor == .white
      ? .black
      : display.backgroundColor

    return configuration.label
      .applyModifier(if: isFullWidth, FullWidthModifier())
      .padding()
      .font(font)
      .background(background)
      .foregroundColor(display.foregroundColor)
      .cornerRadius(display.cornerRadius)
      .opacity(configuration.isPressed ? 0.6 : 1)
      .overlay(
        RoundedRectangle(cornerRadius:display.cornerRadius)
          .stroke(display.borderColor, lineWidth: 0.5)
      )
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
//      .animation(.easeInOut(duration: 0.1))
      .padding(.vertical, 5)
  }
}

