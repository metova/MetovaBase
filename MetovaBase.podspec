Pod::Spec.new do |s|
  s.name         = "MetovaBase"
  s.version      = "0.2.4"
  s.summary      = "A collection of useful subclasses extending UIKit's functionality."

  s.homepage = "http://metova.com"
  s.license  = { :type => "MIT", :file => "LICENSE" }
  s.authors  = { "Nick Griffith" => "nick.griffith@metova.com" }

  s.platform = :ios, '8.0'

  s.source              = { :git => "https://github.com/metova/MetovaBase.git", :tag => s.version.to_s }
  s.source_files        = "MetovaBase", "MetovaBase/**/*.{h,m,swift}"
  s.public_header_files = 'MetovaBase/**/*.h'
  s.exclude_files       = "MetovaBase/Exclude"
end
