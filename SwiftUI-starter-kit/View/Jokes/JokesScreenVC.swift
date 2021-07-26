//
//  JokesScreenVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/29/21.
//

import SwiftUI
import ObjectMapper
import Alamofire

class Observer : ObservableObject {
  @Published var jokes = [JokeItem]()

  init() {
    getJokes()
  }

  func getJokes(count: Int = 20) {
    AF.request("http://api.icndb.com/jokes/random/\(count)")
      .validate()
      .responseJSON { [weak self] data in
        guard let `self` = self else { return }
        switch data.result {
        case .success:
          let response = Mapper<JokesResponse>().map(JSONObject: data.value)

          if let items = response?.value {
            self.jokes = items
          }

        case.failure:
          print("Error")
        }

      }
  }
}

struct JokesScreenVC: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @ObservedObject var observedData = Observer()

  var body: some View {
    HStack {
      List {
        ForEach(observedData.jokes) { item in
          ListItem(item: item)
        }
      }
      .listStyle(InsetListStyle())

    }
    .padding(.top, 20)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        VStack {
          Text("Jokes").navigationTitle()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton(presentationMode: presentationMode))

  }
}

struct ListItem: View {
  var item: JokeItem
  var body: some View {

    VStack(alignment: .leading,
           spacing: nil,
           content:
            {
              if let id = item.id {
                Text("\(id)").paragraph(weight: .bold, size: 14)
              }

              if let joke = item.joke {
                Text(joke).paragraph()
              }

              if !item.categories!.isEmpty,
                 let categories = item.categories {
                Text("\(categories.joined(separator: ", "))").paragraph(weight: .light, size: 14)
              }

            })
      .padding(.horizontal, 20)
  }
}
