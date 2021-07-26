//
//  NetworkTip.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI

struct NetworkTip: View {

  @ObservedObject var network = NetworkManager()

  var body: some View {

    if !network.isConnected {
      Text("You are offline. Please get back to Network")
        .foregroundColor(Color.white)
        .paragraph(weight: .regular, size: 12)
        .padding(5)
        .frame(maxWidth: .infinity)
        .background(Color.error)
        .transition(.slide)
        .animation(.ripple())
    }

  }
}
