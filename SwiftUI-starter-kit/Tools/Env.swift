//
//  Env.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/6/21.
//

import Foundation

struct Env {

  private static let production : Bool = {
    print("\nEnv:")
    #if DEBUG
    print("DEBUG")
    return false
    #elseif ADHOC
    print("ADHOC")
    return false
    #else
    print("PRODUCTION")
    return true
    #endif
  }()

  static func isProduction () -> Bool {
    return self.production
  }

}
