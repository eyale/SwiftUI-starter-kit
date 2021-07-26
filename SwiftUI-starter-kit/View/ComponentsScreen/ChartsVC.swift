//
//  ChartsVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI
import BeautyChart

struct ChartsVC: View {

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  @State var points:[CGPoint] = [CGPoint(x: 0, y: 17),
                                 CGPoint(x: 1, y: 23),]
  @State var style:LineViewStyle = LineViewStyle().mode2()

  var body: some View {
    ScrollView {
      VStack {
        ChartSmoothView(points: points, title: "So volatile", caption: "Random points", style: self.style)

        ChartSmoothView(points: [
          CGPoint(x: 0, y: 17),
          CGPoint(x: 1, y: 23),
          CGPoint(x: 2, y: 60),
          CGPoint(x: 3, y: 32),
          CGPoint(x: 4, y: 12),
          CGPoint(x: 5, y: 37),
          CGPoint(x: 6, y: 0),
          CGPoint(x: 7, y: 23),
          CGPoint(x: 8, y: 60),
        ], title: "This one is sMoOtH", style: LineViewStyle())

        HStack{
          ChangeBarView(changePercent: 0.3, title: "Style")
          ChangeBarView(changePercent: -0.73233, title: "Beauty")
        }
        ChangeBarView(changePercent: 0.9333, title: "Appreciation", caption: "Based on poll")

      }
      .padding(.horizontal, 40)
      .padding(.vertical, 10)
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        VStack {
          Text("Buttons").navigationTitle()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
    .padding(.horizontal, -20)
  }
}
