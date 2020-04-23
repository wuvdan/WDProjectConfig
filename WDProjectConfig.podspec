#
#  Be sure to run `pod spec lint WDProjectConfig.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "WDProjectConfig"
  s.version      = "2.0.1"
  s.summary      = "iOS 项目搭建配置文件"
  s.description  = "为项目搭建提供简单的屏幕适配和其他简易使用的默认配置"
  s.homepage     = "https://github.com/wuvdan/WDProjectConfig"
  s.license      = "MIT"
  s.platform     = :ios,"9.0"
  s.author       = { "wudan" => "wudan_ios@163.com" }
  s.source       = { :git => "https://github.com/wuvdan/WDProjectConfig.git", :tag => "#{s.version}" }
  s.source_files = "WDProjectConfig", "*.{h,m}"
  s.requires_arc = true
end
