#
# Be sure to run `pod lib lint IJMRandomName.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IJMRandomName"
  s.version          = "0.1.3"
  s.summary          = "Random name generator."
  s.description      = <<-DESC
                     A simple library that generates random names.
                       DESC
  s.homepage         = "https://github.com/ismailmustafa/IJMRandomName"
  s.license          = 'MIT'
  s.author           = { "ismailmustafa" => "ismailmustafa@rocketmail.com" }
  s.source           = { :git => "https://github.com/ismailmustafa/IJMRandomName.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

s.source_files = 'Pod/Classes/*.{h,m}'
s.resources = 'Pod/Classes/*.{txt}'
  s.resource_bundles = {
    'IJMRandomName' => ['Pod/Assets/*.png']
  }
end
