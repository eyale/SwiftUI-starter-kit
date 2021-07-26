//
//  BookingGuidelinesVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/22/21.
//

import SwiftUI

struct BookingGuidelinesVC: View {
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 0, content: {
        Text("Booking Guidelines")
          .title()

        Text("* Bookings are to be made by Opinov8r himself, they are not transferable and should not be made on your behalf.").paragraph()
        Text("* Booking in advance is encouraged (Preferably 24 Hours).").paragraph()
        Text("* Booking Seats on Multiple days is available.").paragraph()

        Text("To book a seat you need to:").subtitle()

        Text("* Choose the number of the seat available in the office layout.").paragraph()
        Text("* Input your username to the cell at the crossing of the date and the seat number.").paragraph()

        Text("To cancel a seat booking you need to:").subtitle()
      })

      VStack(alignment: .leading, spacing: 0, content: {
        Text("* You should cancel your seat reservation not later than 9am on of the day of booking.").paragraph()
        Text("* In case of no-show without prior notice, your booking will be cancelled.").paragraph()
        Text("* Please tidy up before you leave as the seat could be used by another person the next day.").paragraph()
        Text("If you experience any problems with the booking system, please contact Office Manager").paragraph()

        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("Understood")
        }).buttonStyle(CustomButtonStyle(.rounded(type: .primary), isFullWidth: true))
      })

    }.padding(20)

  }
}
