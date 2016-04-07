xcodeproj 'YoChing/YoChing.xcodeproj/'

# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'

# Uncomment this line if you're using Swift
use_frameworks!

target 'YoChing' do

#===============================
#MASTER REPO
source 'https://github.com/CocoaPods/Specs.git'
#===============================

#===============================
# REDROMA REPOSITORY
source 'https://github.com/RedRoma/CocoaSpecs.git'
#===============================

#pod 'EasyAnimation'

#===============================
# AROMA CLIENT
pod 'AromaThrift', '1.9'
#pod 'AromaSwiftClient', :git => 'https://github.com/RedRoma/aroma-swift-client.git', :branch => 'develop'
#===============================

#===============================
# NOTIFICATION BANNER
pod 'BRYXBanner'
#===============================


end

target 'YoChingTests' do

end

post_install do |installer|

#    Unescaped command useful for the terminal
#    `find Pods -regex 'Pods/AromaThrift/.*\.h' -print0 | xargs -0 sed -i  '' 's_\(.*import\) "\(T.*h.*\)"_\1 <Thrift/\2>_'`
`find Pods -regex '.*/*/AromaThrift/.*\.h' -print0 | xargs -0 sed -i  '' 's_\\(.*import\\) \\"\\(T.*h.*\\)\\"_\\1 <ThriftLib/\\2>_'`

installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
end

end