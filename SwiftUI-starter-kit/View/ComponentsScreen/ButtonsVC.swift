//
//  ButtonsVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/23/21.
//

import SwiftUI

struct ButtonsVC: View {

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    ScrollView {
      Group {
        Button(action: {
        }, label: {
          Text("Default - Full Width - primary")
        })
        .buttonStyle(CustomButtonStyle(.default(type: .primary), isFullWidth: true))

        Button(action: {}, label: {
          Text("Outline - Full Width - primary")
        })
        .buttonStyle(CustomButtonStyle(.outline(type: .primary), isFullWidth: true))

        Button(action: {}, label: {
          Text("Rounded - Full Width - primary")
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .primary), isFullWidth: true))

        Button(action: {}, label: {
          Text("Transparent - Full Width - primary")
        })
        .buttonStyle(CustomButtonStyle(.transparent(type: .primary), isFullWidth: true))
      }

      Group {
        Button(action: {}, label: {
          Text("Default")
        })
        .buttonStyle(CustomButtonStyle(.default(type: .primary)))
        Button(action: {}, label: {
          Text("outline")
        })
        .buttonStyle(CustomButtonStyle(.outline(type: .primary)))
        Button(action: {}, label: {
          Text("rounded")
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .primary)))
        Button(action: {}, label: {
          Text("transparent")
        })
        .buttonStyle(CustomButtonStyle(.transparent(type: .primary)))
      }

      Group {
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))

            Text("Default with icon - primary")
          }
        })
        .buttonStyle(CustomButtonStyle(.default(type: .primary)))
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .primaryColor).uiColor()))

            Text("outline with icon - primary")
          }
        })
        .buttonStyle(CustomButtonStyle(.outline(type: .primary)))
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))

            Text("rounded with icon - primary")
          }
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .primary)))
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .primaryColor).uiColor()))

            Text("transparent with icon - primary")
          }
        })
        .buttonStyle(CustomButtonStyle(.transparent(type: .primary)))
      }

      //----------------------------------------------------------------------------------------

      Group {
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))
            Text("default with icon - success")
          }
        })
        .buttonStyle(CustomButtonStyle(.default(type: .success)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .successColor).uiColor()))
            Text("outline with icon - success")
          }
        })
        .buttonStyle(CustomButtonStyle(.outline(type: .success)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))
            Text("rounded with icon - success")
          }
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .success)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .successColor).uiColor()))

            Text("transparent with icon - success")
          }
        })
        .buttonStyle(CustomButtonStyle(.transparent(type: .success)))
      }


      //----------------------------------------------------------------------------------------

      Group {
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))
            Text("Default with icon - warning")
          }
        })
        .buttonStyle(CustomButtonStyle(.default(type: .warning)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .warningColor).uiColor()))
            Text("outline with icon - warning")
          }
        })
        .buttonStyle(CustomButtonStyle(.outline(type: .warning)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))
            Text("rounded with icon - warning")
          }
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .warning)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .warningColor).uiColor()))

            Text("transparent with icon - warning")
          }
        })
        .buttonStyle(CustomButtonStyle(.transparent(type: .warning)))
      }

      //----------------------------------------------------------------------------------------

      Group {
        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))
            Text("Default with icon - error")
          }
        })
        .buttonStyle(CustomButtonStyle(.default(type: .error)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .errorColor).uiColor()))
            Text("outline with icon - error")
          }
        })
        .buttonStyle(CustomButtonStyle(.outline(type: .error)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .white))
            Text("rounded with icon - error")
          }
        })
        .buttonStyle(CustomButtonStyle(.rounded(type: .error)))

        Button(action: {}, label: {
          HStack {
            Image(uiImage: UIImage(icon: .icofont(.socialTwitter),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: RemoteConfigVM.shared.color(for: .errorColor).uiColor()))

            Text("transparent with icon - error")
          }
        })
        .buttonStyle(CustomButtonStyle(.transparent(type: .error)))
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
