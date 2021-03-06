# CREATED BY LUO YU
# `pod lib lint PreferencesKit.podspec'


Pod::Spec.new do |s|
	s.name             = 'PreferencesKit'
	s.version          = '1.0.1'
	s.summary          = 'Preferences View from configuration file.'

	s.description      = <<-DESC
Using plist configuration file to set and auto generate preferences view.
					   DESC

	s.homepage         = 'https://github.com/blodely/PreferencesKit.git'

	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'Luo Yu' => 'indie.luo@gmail.com' }
	s.source           = { :git => 'https://github.com/blodely/PreferencesKit.git', :tag => s.version.to_s }

	s.social_media_url = 'https://weibo.com/blodely'

	s.ios.deployment_target = '9.0'

	s.source_files = 'PreferencesKit/Classes/**/*', 'PreferencesKit/Classes/cell/*'

	# s.resource_bundles = {
	#   'PreferencesKit' => ['PreferencesKit/Assets/*.png']
	# }

	# s.public_header_files = 'Pod/Classes/**/*.h'
	# s.frameworks = 'UIKit', 'MapKit'

	s.ios.frameworks = 'UIKit'

	s.libraries = 'xml2'

	s.dependency 'FCFileManager', '~> 1.0.18'
	s.dependency 'GDataXML-HTML'
	s.dependency 'Masonry', '~> 1.1.0'
	s.dependency 'LYCategory'

end
