//
//  PopupVC.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 7/1/21.
//

import SwiftUI
import Firebase
import ExytePopupView

struct ExampleButton : View {
  @Binding var showing: Bool
  var title: String
  var hideAll: ()->()

  var body: some View {
    Button(action: {
      self.hideAll()
      self.showing.toggle()
    }) {
      Text(title).paragraph()
    }
  }
}

struct PopupVC : View {

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State private var user = Auth.auth().currentUser

  let popupColor = Color(hex: "3d5a80")
  let topToastColor = Color(hex: "293241")
  let bottomToastColor = Color(hex: "98c1d9")
  let topFloatColor = Color(hex: "293241")
  let bottomFloatColor = Color(hex: "ee6c4d")
  let cardColor = Color(hex: "3d5a80")

  @State var showingPopup = false
  @State var showingTopToast = false
  @State var showingBottomToast = false
  @State var showingTopFloater = false
  @State var showingBottomFloater = false
  @State var showingDraggableCard = false
  @State var showingScrollableDraggableCard = false

  private var screenSize: CGSize {
    #if os(iOS)
    return UIScreen.main.bounds.size
    #else
    return NSScreen.main?.frame.size ?? .zero
    #endif
  }

  var body: some View {

    let hideAll = {
      self.showingPopup = false
      self.showingTopToast = false
      self.showingBottomToast = false
      self.showingTopFloater = false
      self.showingBottomFloater = false
      self.showingDraggableCard = false
      self.showingScrollableDraggableCard = false
    }

    return ZStack {

      VStack(spacing: 15) {
        ExampleButton(showing: $showingPopup, title: "Popup", hideAll: hideAll)
//        ExampleButton(showing: $showingTopToast, title: "Top toast", hideAll: hideAll)
        ExampleButton(showing: $showingBottomToast, title: "Bottom toast", hideAll: hideAll)
//        ExampleButton(showing: $showingTopFloater, title: "Top floater", hideAll: hideAll)
        ExampleButton(showing: $showingBottomFloater, title: "Bottom floater", hideAll: hideAll)
        ExampleButton(showing: $showingDraggableCard, title: "Draggable card", hideAll: hideAll)
        ExampleButton(showing: $showingScrollableDraggableCard, title: "Draggable scrollable card", hideAll: hideAll)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        VStack {
          Text("Popups").navigationTitle()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
    .padding(.horizontal, -20)
    .edgesIgnoringSafeArea(.all)

    .popup(isPresented: $showingPopup, type: .`default`, closeOnTap: false) {
      createPopup()
    }

    .popup(isPresented: $showingTopToast,
           type: .toast,
           position: .top,
           autohideIn: 2) {
      createTopToast()
    }

    .popup(isPresented: $showingBottomToast,
           type: .toast,
           position: .bottom) {
      createBottomToast()
    }

    .popup(isPresented: $showingTopFloater,
           type: .floater(),
           position: .top,
           animation: Animation.spring(),
           autohideIn: 2) {
      createTopFloater()
    }

    .popup(isPresented: $showingBottomFloater,
           type: .floater(),
           position: .bottom,
           animation: Animation.spring(),
           autohideIn: 5) {
      createBottomFloater()
    }

    .popup(isPresented: $showingDraggableCard,
           type: .toast,
           position: .bottom) {
      createDraggableCard()
    }

    .popup(isPresented: $showingScrollableDraggableCard,
           type: .toast,
           position: .bottom) {
      createScrollableDraggableCard()
    }

  }
  

  func createPopup() -> some View {
    VStack(spacing: 10) {
      Avatar()

      Text("Tutorial")
        .foregroundColor(.white)
        .title()

      Text("In this example floats are set to disappear after 2 seconds. Tap the toasts to dismiss or just open some other popup - previous one will be dismissed. This popup will only be closed if you tap the button.")
        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
        .paragraph(weight: .light, size: 14)

      Spacer()

      Button(action: {
        self.showingPopup = false
      }) {
        Text("Got it")
          .font(.system(size: 14))
          .foregroundColor(.black)
          .fontWeight(.bold)
      }
      .frame(width: 100, height: 40)
      .background(Color.white)
      .cornerRadius(20.0)
    }
    .padding(EdgeInsets(top: 70, leading: 20, bottom: 40, trailing: 20))
    .frame(width: 300, height: 400)
    .background(self.popupColor)
    .cornerRadius(10.0)
    .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
  }

  func createTopToast() -> some View {
    VStack {
      Spacer(minLength: 20)
      HStack() {
        Avatar()
        VStack(alignment: .leading, spacing: 2) {
          HStack {
            if let name = user?.displayName {
              Text(name)
                .foregroundColor(.white)
                .fontWeight(.bold)
            }
            Spacer()
            Text("11:30")
              .font(.system(size: 12))
              .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
          }

          Text("How about a dinner in an hour? We could discuss that one urgent issue we should be discussing.")
            .lineLimit(2)
            .font(.system(size: 14))
            .foregroundColor(.white)
        }
      }
      .padding(15)
    }
    .frame(maxWidth: .infinity)
    .frame(height: 110)
    .background(self.topToastColor)
  }

  func createBottomToast() -> some View {
    VStack() {
      HStack() {
        Avatar()
        VStack(alignment: .leading, spacing: 2) {
          Text("Grapes! Grapes! Grapes!")
            .foregroundColor(.black)
            .fontWeight(.bold)

          Text("Step right up! Buy some grapes now - that's a brilliant investment and you know it!")
            .lineLimit(2)
            .font(.system(size: 14))
            .foregroundColor(.black)
        }
      }
      Spacer(minLength: 10)
    }
    .padding(15)
    .frame(width: screenSize.width, height: 100)
    .background(self.bottomToastColor)
  }

  func createTopFloater() -> some View {
    HStack(spacing: 10) {
      VStack(spacing: 8) {
        Text("Coffee temperature")
          .font(.system(size: 12))
          .foregroundColor(.white)

        HStack(spacing: 0) {
          Color(red: 1, green: 112/255, blue: 59/255)
            .frame(width: 30, height: 5)
          Color(red: 1, green: 1, blue: 1)
            .frame(width: 70, height: 5)
        }.cornerRadius(2.5)
      }
    }
    .frame(width: 200, height: 60)
    .background(self.topFloatColor)
    .cornerRadius(30.0)
  }

  func createBottomFloater() -> some View {
    HStack(spacing: 15) {
      Avatar()
      VStack(alignment: .leading, spacing: 2) {
        Text("Ever thought of taking a break?")
          .foregroundColor(.black)
          .fontWeight(.bold)

        Text("Our hand picked organic fresh tasty coffee from southern slopes of Australia is bound to lighten your mood.")
          .font(.system(size: 14))
          .foregroundColor(.black)
      }
    }
    .padding(15)
    .frame(width: 300, height: 160)
    .background(self.bottomFloatColor)
    .cornerRadius(20.0)
  }

  func createDraggableCard() -> some View {
    DraggableCardView(bgColor: cardColor) {
      VStack(spacing: 10) {
        Text("Weasels")
          .foregroundColor(.white)
          .subtitle()

        Text(Constants.shortText)
          .foregroundColor(.white)
          .paragraph(weight: .light, size: 12)
      }
      .padding(.horizontal, 20)
    }
  }

  func createScrollableDraggableCard() -> some View {
    DraggableCardView(topPadding: 300, fixedHeight: true, bgColor: cardColor) {
      ScrollView {
        VStack(spacing: 10) {
          Text("Mongoose")
            .foregroundColor(.white)
            .subtitle()

          Text(Constants.longText)
            .foregroundColor(.white)
            .paragraph()

        }
        .padding(.horizontal, 20)
      }
    }
  }

}

struct DraggableCardView<Content: View>: View {
  let content: Content
  let topPadding: CGFloat
  let fixedHeight: Bool
  let bgColor: Color

  init(topPadding: CGFloat = 100,
       fixedHeight: Bool = false,
       bgColor: Color = .white,
       @ViewBuilder content: () -> Content) {
    self.content = content()
    self.topPadding = topPadding
    self.fixedHeight = fixedHeight
    self.bgColor = bgColor
  }

  var body: some View {
    ZStack {
      bgColor.cornerRadius(40, corners: [.topLeft, .topRight])
      VStack {
        Color.white
          .frame(width: 72, height: 6)
          .clipShape(Capsule())
          .padding(.top, 15)
          .padding(.bottom, 10)

        content
          .padding(.bottom, 30)
          .applyIf(fixedHeight) {
            $0.frame(height: UIScreen.main.bounds.height - topPadding)
          }
          .applyIf(!fixedHeight) {
            $0.frame(maxHeight: UIScreen.main.bounds.height - topPadding)
          }
      }
    }
    .fixedSize(horizontal: false, vertical: true)
  }
}




class Constants {

  static let shortText = """
                     Weasels /ˈwiːzəl/ are mammals of the genus Mustela of the family Mustelidae. The genus Mustela includes the least weasels, polecats, stoats, ferrets and mink. Members of this genus are small, active predators, with long and slender bodies and short legs. The family Mustelidae, or mustelids, (which also includes badgers, otters, and wolverines) is often referred to as the "weasel family". In the UK, the term "weasel" usually refers to the smallest species, the least weasel (M. nivalis),[1] the smallest carnivoran species.[2]
                     Weasels vary in length from 173 to 217 mm (6+3⁄4 to 8+1⁄2 in),[3] females being smaller than the males, and usually have red or brown upper coats and white bellies; some populations of some species moult to a wholly white coat in winter. They have long, slender bodies, which enable them to follow their prey into burrows. Their tails may be from 34 to 52 mm (1+1⁄4 to 2 in) long.[3]
                     """

  static let longText = """
                     A mongoose is a small terrestrial carnivorous mammal belonging to the family Herpestidae. This family is currently split into two subfamilies, the Herpestinae and the Mungotinae. The Herpestinae comprises 23 living species that are native to southern Europe, Africa and Asia, whereas the Mungotinae comprises 11 species native to Africa.[2] The Herpestidae originated about 21.8 ± 3.6 million years ago in the Early Miocene and genetically diverged into two main genetic lineages between 19.1 and 18.5 ± 3.5 million years ago.[3]
                     The English word \"mongoose\" used to be spelled \"mungoose\" in the 18th and 19th centuries. The name is derived from names used in India for Herpestes species:[4][5][6][7] muṅgūs or maṅgūs in classical Hindi;[8] muṅgūsa in Marathi;[9] mungisa in Telugu;[10] mungi, mungisi and munguli in Kannada.[11]
                     The form of the English name (since 1698) was altered to its "-goose" ending by folk etymology.[12] The plural form is "mongooses".[13]
                     Mongooses have long faces and bodies, small, rounded ears, short legs, and long, tapering tails. Most are brindled or grizzly; a few have strongly marked coats which bear a striking resemblance to mustelids. Their nonretractile claws are used primarily for digging. Mongooses, much like goats, have narrow, ovular pupils. Most species have a large anal scent gland, used for territorial marking and signaling reproductive status. They range from 24 to 58 cm (9.4 to 22.8 in) in head-to-body length, excluding the tail. In weight, they range from 320 g (11 oz) to 5 kg (11 lb).[14]
                     Mongooses are one of at least four known mammalian taxa with mutations in the nicotinic acetylcholine receptor that protect against snake venom.[15] Their modified receptors prevent the snake venom α-neurotoxin from binding. These represent four separate, independent mutations. In the mongoose, this change is effected, uniquely, by glycosylation.[16]
                     Herpestina was a scientific name proposed by Charles Lucien Bonaparte in 1845 who considered the mongooses a subfamily of the Viverridae.[17] In 1864, John Edward Gray classified the mongooses into three subfamilies: Galidiinae, Herpestinae and Mungotinae.[18] This grouping was supported by Reginald Innes Pocock in 1919, who referred to the family as "Mungotidae".[19]
                     Genetic research based on nuclear and mitochondrial DNA analyses revealed that the Galidiinae are more closely related to Madagascar carnivores, including the fossa and Malagasy civet.[20][21] Galidiinae is presently considered a subfamily of Eupleridae.[22]
                     """
}
