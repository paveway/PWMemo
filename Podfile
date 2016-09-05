source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!

pod 'Google-Mobile-Ads-SDK', '~> 7.0'
pod 'XLForm', '~> 3.0'
pod 'SCLAlertView'
pod 'FlatUIKit'
pod 'SWTableViewCell', '~> 0.3.7'
pod 'ECSlidingViewController', '~> 2.0.3'
pod 'DZNEmptyDataSet'
pod 'NJKScrollFullScreen'
pod 'SVWebViewController'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end

