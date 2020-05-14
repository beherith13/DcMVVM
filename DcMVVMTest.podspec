#
# Be sure to run `pod lib lint DcMVVM.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DcMVVMTest'
  s.version          = '0.1.0'
  s.summary          = 'Test tools for DcMVVM.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Set of protocols, extensions and mocks which help to test MVVM components if DcMVVM framework.
                       DESC

  s.homepage         = 'https://github.com/beherith13/DcMVVMTest'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Siarhei Bykau'
  s.source           = { :git => 'https://github.com/beherith13/DcMVVM.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.subspec "Core" do |sb|
    sb.dependency 'DcMVVM/Core'
    sb.source_files = "Sources/DcMVVMTest/Core/**/*.swift"
  end

  s.default_subspecs = 'Core'
  
  end
