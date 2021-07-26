# 
# 
# Uncomment the next line to define a global platform for your project
platform :ios, '14.4'

target 'SwiftUI-starter-kit' do
  use_frameworks!

  #  UI
  pod 'SwiftIcons', '~> 3.0'
  pod 'BeautyChart'
  pod 'ExytePopupView'

  #  Tools/Helpers
  pod 'IQKeyboardManagerSwift', '~> 6.3'
  pod 'SwiftDate', '~> 6.3'

  #  REST Helpers
  pod 'Alamofire', '~> 5.4'
  pod 'Kingfisher', '~> 6.3'
  pod 'ObjectMapper', '~> 4.2'

  #  Google API
  pod 'Firebase/Auth'
  pod 'GoogleSignIn'
  pod 'Firebase/Analytics'
  pod 'Firebase/RemoteConfig'
  pod 'Firebase/Crashlytics'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.3'
      # Remove warning: “-pie being ignored.   it is only used when linking a main executable”
      config.build_settings['LD_NO_PIE'] = 'NO'
    end
  end
end
