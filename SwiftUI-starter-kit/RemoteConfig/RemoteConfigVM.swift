//
//  RemoteConfigVM.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/24/21.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfig

/**
 `RemoteConfigVM` singleton class that expose methods to work with Firebase RemoteConfig
 
 - parameter shared: exposing values and methods.
 - returns: instance of RemoteConfig View Model
 - warning: communicate with Firebase RemoteConfig via ViewModel
 
 # Notes: #
 1. For variables check https://console.firebase.google.com/u/1/project/locky-52796/config
 
 */

typealias RemoteConfigType = [String: NSObject]

// MARK: - Singletone
class RemoteConfigVM {
  static let shared = RemoteConfigVM()
  
  private init() {
    loadDefaultValues()
    fetchCloudValues()
  }
  
}

// MARK: - Setting default values
extension RemoteConfigVM {
  func loadDefaultValues() {
    let appDefaults: [String: Any?] = [
      AppDefaultValueKeys.colors.tintColor.rawValue: Color.tint.uiColor().hexString,
      AppDefaultValueKeys.colors.primaryColor.rawValue: Color.primary.uiColor().hexString,
      AppDefaultValueKeys.colors.secondaryColor.rawValue: Color.secondary.uiColor().hexString,
      AppDefaultValueKeys.colors.foregroundColor.rawValue: Color.foreground.uiColor().hexString,
      AppDefaultValueKeys.colors.foregroundDarkModeColor.rawValue: Color.foregroundDarkModeColor.uiColor().hexString,
      AppDefaultValueKeys.colors.backgroundColor.rawValue: Color.background.uiColor().hexString,
      AppDefaultValueKeys.colors.backgroundDarkModeColor.rawValue: Color.backgroundDarkModeColor.uiColor().hexString,
      AppDefaultValueKeys.colors.errorColor.rawValue: Color.error.uiColor().hexString,
      AppDefaultValueKeys.colors.warningColor.rawValue: Color.warning.uiColor().hexString,
      AppDefaultValueKeys.colors.successColor.rawValue: Color.success.uiColor().hexString
    ]
    
    RemoteConfig.remoteConfig().setDefaults(appDefaults as? RemoteConfigType)
  }
}

// MARK: - Setup
extension RemoteConfigVM {
  func activateDebugMode() {
    let settings = RemoteConfigSettings()
    
    //    by DEFAULT retreiving values - (43200) 12 hours
    settings.minimumFetchInterval = 0
    RemoteConfig.remoteConfig().configSettings = settings
  }
  func fetchCloudValues() {
    //    comment before PROD
    activateDebugMode()
    
    RemoteConfig.remoteConfig().fetch { [weak self] result, error in
      if let error = error {
        print("\nERROR fetching RemoteConfig values: ", error)
        return
      }
      
      RemoteConfig.remoteConfig().activate { _,_ in
        print("\nRetrieved values from the cloud!")
      }
    }
    
  }
}

// MARK: - Helpers
extension RemoteConfigVM {

  func color(for key: ColorNames) -> Color {
    guard let hex = RemoteConfig.remoteConfig()[key.rawValue].stringValue else {

      return Color(ColorNames.init(rawValue: key.rawValue)!.rawValue)
    }

    return Color(hex: hex)
  }
}
