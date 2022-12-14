# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'Rick&Morty' do
  use_frameworks!
  
  pod 'SnapKit'
  pod 'Alamofire'
  pod 'Kingfisher', '~> 7.0'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
