//
//  DevAnalytics.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/6/21.
//

import Foundation
import SwiftUI
import FirebaseAnalytics
import Firebase

class DevAnalytics {
  enum ErrorLevel {
    case warning, error, critical
  }

  static let env = Env.isProduction() ? "prod" : "qa"

  static func logEvent(_ event: String, _ parameters: [String: Any]? = nil) {
    let email = Auth.auth().currentUser?.email ?? "no_email"
    let parametersDefault: [String: Any] = [
      "platform": "iOS",
      "username": email,
      "environment": env]

    if parameters != nil {
      let parametersMerged = parametersDefault.merging(parameters!) { (current, _) in current }

      Analytics.logEvent(event, parameters: parametersMerged)
    } else {
      Analytics.logEvent(event, parameters: parametersDefault)
    }
  }


  static func unexpectedError(_ message: String,
                              _ level: ErrorLevel = .warning,
                              relevantInfo: [String: Any]? = nil) {
    let email = Auth.auth().currentUser?.email ?? "no_email"

    Analytics.logEvent("backend_error", parameters: [
      "platform": "iOS",
      "username": email,
      "environment": env,
      "ErrorLevel": level
    ])
  }


  static func setUserID(userID: String) {
    Analytics.setUserID(userID)
  }
  static func setProperties(for name: String, value: String) {
    Analytics.setUserProperty(value, forName: name)
  }
}

enum AnalyticEvents: String {
  case sign_in
}
