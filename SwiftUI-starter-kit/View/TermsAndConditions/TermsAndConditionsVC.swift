//
//  TermsAndConditionsVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/5/21.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import WebKit

struct TermsAndConditionsVC: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @ObservedObject var viewModel = ViewModel()
  @State var showLoader = false

  var body: some View {
    ZStack {
      VStack(spacing: 0) {

        WebView(url: K.termsURL, viewModel: viewModel)
        WebViewNavigationBar(viewModel: viewModel)
        
      }.onReceive(self.viewModel.showLoader.receive(on: RunLoop.main)) { value in
        self.showLoader = value
      }

      Loader(isLoader: showLoader)
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        VStack {
          Text("Terms and Conditions").navigationTitle()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
  }
}
