#
# Be sure to run `pod lib lint RandomUser.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RandomUser"
  s.version          = "0.1.0"
  s.summary          = "Objective c iOS library for to generate random users, using https://randomuser.me/"
  s.homepage         = "https://github.com/oarrabi/RandomUser.git"
  s.screenshots     = "http://i1348.photobucket.com/albums/p740/o_abdelhafith/rnd_zpsyeb4amjw.gif"
  s.license          = 'MIT'
  s.author           = { "Omar Abdelhafith" => "o.arrabi@me.com" }
  s.source           = { :git => "https://github.com/oarrabi/RandomUser.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ifnottrue'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'RandomUser' => ['Pod/Assets/*.png']
  }
  
end
