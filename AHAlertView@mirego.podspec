Pod::Spec.new do |s|
  s.name         = 'AHAlertView@mirego'
  s.version      = '1.2.1'
  s.summary      = "AHAlertView is a powerful, block-based alternative to UIKit's UIAlertView."
  s.homepage     = 'https://github.com/mirego/AHAlertView'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Warren Moore' => 'wm@warrenmoore.net', 'Mirego, Inc.' => 'info@mirego.com' }
  s.source       = { :git => 'https://github.com/mirego/AHAlertView.git', :tag => s.version.to_s }
  s.platform     = :ios, '5.0'
  s.source_files = 'AHAlertView/AHAlertView.{h,m}'
  s.public_header_files = 'AHAlertView/AHAlertView.h'
  s.frameworks   = 'QuartzCore'
  s.requires_arc = true
end
