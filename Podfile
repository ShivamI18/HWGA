platform :ios, '13.0'  # Set the minimum iOS version

# Ignore warnings
inhibit_all_warnings!

# Uncomment if using Swift
use_frameworks!

target 'BackgroundVideoRecorder' do
  # Pods for BackgroundVideoRecorder

  # Example common dependencies (add/remove as needed)
  pod 'AFNetworking', '~> 4.0' # Networking library
  pod 'Alamofire', '~> 5.6'    # Alternative networking library
  pod 'SwiftyJSON', '~> 5.0'   # JSON parsing
  pod 'Firebase/Core'          # Firebase support
  pod 'Firebase/Auth'          # Firebase Authentication
  pod 'Firebase/Database'      # Firebase Database
  pod 'Firebase/Storage'       # Firebase Storage

  # Video-related dependencies (if applicable)
  pod 'GPUImage'               # Video processing
  pod 'AVProVideo'             # Advanced AVPlayer controls

  # Uncomment the line below if using React Native
  # config = use_native_modules!

  # If using Swift Package Manager, keep this
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
