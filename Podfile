use_frameworks!
platform :ios, '15.0'

# Default Specs.git:

source 'https://github.com/CocoaPods/Specs.git'

target 'MobiledgeXiOSGrpcLibrary' do
  pod 'PromisesSwift', '~> 2.0.0'
  pod 'Socket.IO-Client-Swift', '~> 16.0.1'
  pod 'SwiftyJSON', '~> 5.0.1'
  pod 'gRPC-Swift', '~> 1.7.1'
  pod 'SPLPing', '~> 1.1.8'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
    target.build_configurations.each do |config|
      # allow Apple Silicon
      #config.build_settings['ARCHS[sdk=iphonesimulator*]'] =  `uname -m`
      #config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = "arm64"
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      config.build_settings['VALIDATE_PRODUCT'] = 'NO'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
      # some older pods don't support some architectures
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'

      # exclude from Build Library for Distribution:
      if target.name == "gRPC-Swift" || target.name == "_NIODataStructures" || target.name == "SwiftNIO" || target.name == "SwiftNIOCore" || target.name == "SwiftNIOPosix" || target.name == "SwiftNIOEmbedded" ||  target.name == "SwiftNIOConcurrencyHelpers" || target.name == "SwiftNIOExtras" || target.name == "SwiftNIOFoundationCompat" || target.name == "SwiftNIOHPACK" || target.name == "SwiftNIOHTTP1" || target.name == "SwiftNIOHTTP2" || target.name == "SwiftNIOSSL" || target.name == "SwiftNIOTLS" || target.name == "SwiftNIOTransportServices"
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'NO'
      end
    end
  end
end
