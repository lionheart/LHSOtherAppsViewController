Pod::Spec.new do |s|
  s.name         = "LHSOtherAppsViewController"
  s.version      = "1.0.0"
  s.summary      = "A table view controller used to showcase your other apps."
  s.homepage     = "http://lionheartsw.com"
  s.license      = 'Apache 2.0'
  s.author       = { "Eric Olszewski" => "eric@lionheartsw.com" }
  s.social_media_url = "http://twitter.com/eric_olszewski"
  s.source       = { :git => "https://github.com/lionheart/LHSOtherAppsViewController.git", :tag => "#{s.version}" }
  s.source_files = 'LHSOtherAppsViewController/*.{h,m}'
  s.public_header_files = 'LHSOtherAppsViewController/*.h'
  s.requires_arc = true
  s.dependency 'SDWebImage'

  s.platform     = :ios, '7.0'
  s.framework  = 'UIKit'
  s.requires_arc = true
end

