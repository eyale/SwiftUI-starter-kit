//
//  BookingVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/22/21.
//

import SwiftUI

struct BookingVC: View {
  var image = UIImage(named: ImageNames.image01)
  @State var scale: CGFloat = 1.0
  @State var lastScaleValue: CGFloat = 1.0

  var body: some View {

    VStack{
      ScrollView([.vertical, .horizontal], showsIndicators: false){
        ZStack{

          Rectangle().foregroundColor(.clear).frame(width: image!.size.width * scale, height: image!.size.height * scale, alignment: .center)

          Image(uiImage: image!).scaleEffect(scale)
            .gesture(MagnificationGesture().onChanged { val in
              let delta = val / self.lastScaleValue
              self.lastScaleValue = val
              var newScale = self.scale * delta
              if newScale < 1.0
              {
                newScale = 1.0
              }
              scale = newScale
            }.onEnded{val in
              lastScaleValue = 1
            })


        }
      }
      .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))

      Spacer()

      NavigationLink(destination: BookDeskScreenVC()) {
        Text("Book desk")
      }
      .buttonStyle(CustomButtonStyle(.rounded(type: .primary), isFullWidth: true))
      .padding(.horizontal, 20)

    }
    .padding(.top, 20)
    .padding(.bottom, 10)


  }
}
