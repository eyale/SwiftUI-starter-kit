//
//  BookDeskScreenVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/22/21.
//

import SwiftUI

struct BookDeskScreenVC: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @Environment(\.colorScheme) var colorScheme: ColorScheme

  var color: Color {
    colorScheme == .dark
      ? RemoteConfigVM.shared.color(for: .foregroundDarkModeColor)
      : RemoteConfigVM.shared.color(for: .foregroundColor)
  }

  @State private var desk: String = ""
  @State private var selectedDate = Date()
  static let dateFormat: DateFormatter = {
    let formatter = DateFormatter()
    
    formatter.dateStyle = .short
    return formatter
  }()

  @State private var showingDetail = false

  var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 10, content: {

        Text("Desk number")
          .label()
        TextField("", text: $desk)
          .standartUI()
          .keyboardType(.numberPad)

        DatePicker("Select Date for booking Desk",
                   selection: $selectedDate,
                   displayedComponents: .date)
          .font(.custom(CustomFont.medium.rawValue, size: 14))
          .padding(.top, 20)
          .foregroundColor(color)

        Spacer()
        if let date = selectedDate, let desk = desk {
          Text("You selected \(desk) desk. At \(date, formatter: Self.dateFormat) date")
            .paragraph()
            .padding(.bottom, 10)
        }

        Button(action: {
          showingDetail = true
        }, label: {
          Text("Show Booking Guidelines")
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .primary),
                                       isFullWidth: true))
        .sheet(isPresented: $showingDetail) {
          BookingGuidelinesVC()
        }
      })
    }
    .padding(20)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        VStack {
          Text("Book a Desk").navigationTitle()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton(presentationMode: presentationMode))

  }
}
