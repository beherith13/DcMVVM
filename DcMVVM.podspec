#
# Be sure to run `pod lib lint DcMVVM.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DcMVVM'
  s.version          = '0.1.0'
  s.summary          = 'Declarative MVVM for Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Declarative MVVM-C pattern for Swift optimized to be used in couple with reactive programming frameworks like RxSwift, ReactiveCocoa and Combine.
                       DESC

  s.homepage         = 'https://github.com/beherith13/DcMVVM'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Siarhei Bykau'
  s.source           = { :git => 'https://github.com/beherith13/DcMVVM.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.subspec "Core" do |sb|
    sb.source_files = "Sources/DcMVVM/Core/**/*.swift"
  end
  
  s.subspec "UIKit" do |sb|
    sb.dependency 'DcMVVM/Core'
    sb.source_files = "Sources/DcMVVM/UIKit/*.swift"
  end
  
  s.subspec "RxSwift" do |sb|
    sb.dependency 'DcMVVM/Core'
    sb.dependency 'RxSwift', '~> 5'
    sb.source_files = "Sources/DcMVVM/RxSwift/*.swift"
  end
  
  s.subspec "ReactiveSwift" do |sb|
    sb.dependency 'DcMVVM/Core'
    sb.dependency 'ReactiveSwift', '~> 6'
    sb.source_files = "Sources/DcMVVM/ReactiveSwift/*.swift"
  end
  
  s.subspec "Combine" do |sb|
    sb.dependency 'DcMVVM/Core'
    sb.source_files = "Sources/DcMVVM/Combine/*.swift"
  end

  s.default_subspecs = 'Core'
end
