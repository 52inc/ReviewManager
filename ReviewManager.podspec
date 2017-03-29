#
# Be sure to run `pod lib lint Pulley.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReviewManager'
  s.version          = '1.0.1'
  s.summary          = 'A simple class to handle fallbacks from iOS 10.3\'s review prompt.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple class to handle fallbacks from iOS 10.3's review prompt and automatically forward them to the App Store if the review prompt doesn't show.
                       DESC

  s.homepage         = 'https://github.com/52inc/ReviewManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brendan Lee' => 'brendan@52inc.com' }
  s.source           = { :git => 'https://github.com/52inc/ReviewManager.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/52_inc'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/*.*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'StoreKit'

  s.xcconfig = {
    'SWIFT_VERSION' => '3.0'
  }

end
