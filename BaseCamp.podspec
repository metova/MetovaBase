Pod::Spec.new do |s|
  s.name         = "BaseCamp"
  s.version      = "0.1.0"
  s.summary      = "A short description of BaseCamp."
  s.description  = <<-DESC
                   Useful UIKit subclasses to inherit from.
                   DESC

  s.homepage = "http://metova.com"
  s.license  = { :type => "MIT", :file => "LICENSE" }
  s.authors  = { "Nick Griffith" => "nick.griffith@metova.com" }

  s.platform = :ios, '8.0'

  s.source              = { :git => "http://github/metova/BaseCamp.git", :tag => s.version.to_s }
  s.source_files        = "BaseCamp", "BaseCamp/**/*.{h,m,swift}"
  s.public_header_files = 'BaseCamp/**/*.h'
  s.exclude_files       = "BaseCamp/Exclude"
end
