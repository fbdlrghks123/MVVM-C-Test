use_modular_headers!
inhibit_all_warnings!

target 'MVVM-C' do

# Network
  pod 'Moya'
  pod 'Moya/RxSwift'

# Image
  pod 'RxKingfisher'

# Architecture
  pod 'ReactorKit'

# Rx
  pod 'Then'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxFlow'
  pod 'RxDataSources'
  pod 'RxViewController'
  
# UI
  pod 'SnapKit'
  
# System
  pod 'Gedatsu', configuration: %w(Debug)

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
  end
end
  
