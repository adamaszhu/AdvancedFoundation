platform :ios, '9.0'
use_frameworks!

target 'AdvancedFoundationTests' do
  pod 'Nimble', '9.2.0'
  pod 'Quick', '3.1.2'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
  end
 end
end
