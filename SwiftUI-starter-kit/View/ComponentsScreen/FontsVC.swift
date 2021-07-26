//
//  FontsVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/23/21.
//

import SwiftUI

struct FontsVC: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    ScrollView {
      Group {
        Text("regular 16").paragraph(weight: .regular)
        Text("italic 16").paragraph(weight: .italic)
        Text("light 16").paragraph(weight: .light)
        Text("lightItalic 16").paragraph(weight: .lightItalic)
        Text("extraLight 16").paragraph(weight: .extraLight)
        Text("extraLightItalic 16").paragraph(weight: .extraLightItalic)
        Text("thin 16").paragraph(weight: .thin)
        Text("thinItalic 16").paragraph(weight: .thinItalic)
        Text("medium 16").paragraph(weight: .medium)
        Text("mediumItalic 16").paragraph(weight: .mediumItalic)
      }
      Group {
        Text("bold 16").paragraph(weight: .bold)
        Text("boldItalic 16").paragraph(weight: .boldItalic)
        Text("extraBold 16").paragraph(weight: .extraBold)
        Text("extraBoldItalic 16").paragraph(weight: .extraBoldItalic)
        Text("semiBold 16").paragraph(weight: .semiBold)
        Text("semiBoldItalic 16").paragraph(weight: .semiBoldItalic)
        Text("black 16").paragraph(weight: .black)
        Text("blackItalic 16").paragraph(weight: .blackItalic)
      }
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
    .padding(.horizontal, 20)
  }
}
