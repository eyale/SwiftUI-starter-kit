//
//  ConnectivityManager.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//
import Foundation
import Network

final class NetworkManager: ObservableObject {
  let  monitor = NWPathMonitor()
  let queue = DispatchQueue(label: "NetworkManager")

  @Published var isConnected = true

  init() {
    monitor.pathUpdateHandler = { [weak self] path in
      DispatchQueue.main.sync {
        self?.isConnected = path.status == .satisfied ? true : false
      }
    }

    monitor.start(queue: queue)

  }

}
