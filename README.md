#  SwiftUI-starter-kit

Supports: iOS 14.4 and above

## Features
* Created with mind to grows using SwiftUI from Apple
* Google signin
* Google Analitycs and Google Crashlitycs
* Supports both - dark and light mode
* You can configure your brand colors remotely
* Excelent Webview with options to navigate back/forward and reload
* Customizable popups and Alerts
* Ability to create beautiful charts
* Custom fonts
## Branches:
* `master` - stable app releases
* `develop` - development branch, merge your feature branches here

## Dependencies
The project is using cocoapods for managing external libraries and a Gemfile for managing the cocoapods version.

```
pod install
```

### Core Dependencies
* Alamofire
* ObjectMapper
* Moya
* Firebase/Auth
* GoogleSignIn
* Firebase/Analytics
* Firebase/RemoteConfig


## Project structure
* `SwiftUI-starter-kit/View` - contains screens of applications

## Development
In development of this app we aim to [ios-factor app framework](https://ios-factor.com/)


## Steps to run project locally

 * `git reset HEAD --hard`
 * `git pull origin {branch}`
 * `rm -rf Pods Podfile.lock`
 * clean project `Cmd+Shft+K`
 * run project `Cmd+Shft+R`

 ## Create navigation bar for new screen 

 ```
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    VStack {
        /// ......here your UI for screen
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
 ```

## Navigation

`InitialScreenVC` - routes logged and not logged users
According to `ViewRouter` inside `LoggedInVC` app displays correct Screen
`CustomTabBar` - navigates user to desired screen


## Custom fonts added to `Info.plist` and in
```
<key>UIAppFonts</key>
	<array>
		<string>Montserrat-Regular.ttf</string>
		<string>Montserrat-Italic.ttf</string>
		<string>Montserrat-Bold.ttf</string>
		<string>Montserrat-BoldItalic.ttf</string>
		<string>Montserrat-Thin.ttf</string>
		<string>Montserrat-ThinItalic.ttf</string>
		<string>Montserrat-Light.ttf</string>
		<string>Montserrat-LightItalic.ttf</string>
		<string>Montserrat-Black.ttf</string>
		<string>Montserrat-BlackItalic.ttf</string>
		<string>Montserrat-SemiBold.ttf</string>
		<string>Montserrat-SemiBoldItalic.ttf</string>
		<string>Montserrat-Medium.ttf</string>
		<string>Montserrat-MediumItalic.ttf</string>
		<string>Montserrat-ExtraLight.ttf</string>
		<string>Montserrat-ExtraLightItalic.ttf</string>
		<string>Montserrat-ExtraBold.ttf</string>
		<string>Montserrat-ExtraBoldItalic.ttf</string>
	</array>
```

## Google Authentication

[Official docs](https://developers.google.com/identity/sign-in/ios/sign-in?ver=swift)

`AppDelegate` contains initial setup

```
    FirebaseApp.configure()

    GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
```


[Authentication Google Console](https://console.firebase.google.com/u/2/project/locky-52796/authentication/users)
## Remote config

[Official docs](https://cloud.google.com/identity-platform/docs/ios/mfa)

`AppDelegate` contains initial setup

```
    _ = RemoteConfigVM.shared
```

`Info.plist` contains setup from Firebase

```
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>com.googleusercontent.apps.911406760867-spj8psutir3erndicav07finqtqiu3pg</string>
			</array>
		</dict>
	</array>
```

`GoogleServices-info.plist` contains your app info

[Remote config Console](https://console.firebase.google.com/u/2/project/locky-52796/config)

`RemoteConfigVM` contains all logic for loading values from remote config

At this moment we are setting only colors for customisation purposes.


## Google Crashlytics

[Official documentation](https://firebase.google.com/docs/crashlytics/test-implementation?platform=ios)

[Crashlitics console](https://console.firebase.google.com/u/2/project/locky-52796/crashlytics/app/ios:com.opinov8.SwiftUI-starter-kit/issues)

For new project you need to enable it


## Analytics

`DevAnalytics` file contains logic related to Google Analytics

we are logging events with default parameters
```
[
	"platform": "iOS",
    "username": email,
    "environment": env
]
```

Analytic events contains in `AnalyticEvents` enumeration

```
enum AnalyticEvents {
	case sign_in
}
```


