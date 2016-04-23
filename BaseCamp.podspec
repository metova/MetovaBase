Pod::Spec.new do |s|
  s.name         = "BaseCamp"
  s.version      = "0.1.0"
  s.summary      = "A collection of useful subclasses extending UIKit's functionality."

  s.homepage = "http://metova.com"
  s.license  = { :type => "MIT", :file => "LICENSE" }
  s.authors  = { "Nick Griffith" => "nick.griffith@metova.com" }

  s.platform = :ios, '8.0'

  s.source              = { :git => "https://github.com/metova/BaseCamp.git", :tag => s.version.to_s }
  s.source_files        = "BaseCamp", "BaseCamp/**/*.{h,m,swift}"
  s.public_header_files = 'BaseCamp/**/*.h'
  s.exclude_files       = "BaseCamp/Exclude"
end
