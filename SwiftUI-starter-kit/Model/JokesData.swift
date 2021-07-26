//
//  JokesData.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/29/21.
//

import Foundation
import ObjectMapper


class JokesResponse: Mappable, Identifiable {
  var type: String?
  var value: [JokeItem]?

  required init?(map: Map) {}

  func mapping(map: Map) {
    type <- map["type"]
    value <- map["value"]
  }
}

struct JokeItem: Mappable, Identifiable {
  var id: Int?
  var joke: String?
  var categories: [String]?

  init?(map: Map) {}

  mutating func mapping(map: Map) {
    id <- map["id"]
    joke <- map["joke"]
    categories <- map["categories"]
  }
}


