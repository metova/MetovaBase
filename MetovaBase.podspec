Pod::Spec.new do |s|
  s.name         = "MetovaBase"
  s.version      = "2.0.0"
  s.summary      = "A collection of useful subclasses extending UIKit's functionality."

  s.homepage = "http://metova.com"
  s.license  = { :type => "MIT", :file => "LICENSE" }
  s.authors  = {
    "Nick Griffith" => "nick.griffith@metova.com",
    "Logan Gauthier" => "logan.gauthier@metova.com"
  }

  s.platform = :ios, '8.0'
  s.swift_version = '4.2'

  s.source              = { :git => "https://github.com/metova/MetovaBase.git", :tag => s.version.to_s }
  s.source_files        = "MetovaBase", "MetovaBase/**/*.{h,m,swift}"
  s.public_header_files = 'MetovaBase/**/*.h'
  s.exclude_files       = "MetovaBase/Exclude"
end
