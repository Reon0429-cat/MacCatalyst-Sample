require 'cocoapods-catalyst-support'

# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'MacCatalyst-Sample' do
  use_frameworks!
  pod 'Firebase/Analytics'
  pod 'Firebase/Database'
  pod 'Firebase/Firestore'
  pod 'Firebase/Core'
  pod 'SideMenu'
end

catalyst_configuration do
  verbose!
  ios 'Firebase/Analytics'
  ios 'Firebase/Database'
  macos 'Firebase/Database'
end

target 'MacCatalyst-SampleTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'MacCatalyst-SampleUITests' do
  # Pods for testing
end

# Configure your macCatalyst App
post_install do |installer|
	installer.configure_catalyst
end
