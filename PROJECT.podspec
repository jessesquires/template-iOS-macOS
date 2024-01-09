Pod::Spec.new do |s|
   s.name = 'PROJECT'
   s.version = '1.0.0'
   s.license = 'MIT'

   s.summary = 'SUMMARY'
   s.homepage = 'https://github.com/jessesquires/PROJECT'
   s.documentation_url = 'https://jessesquires.github.io/PROJECT'
   s.social_media_url = 'https://www.jessesquires.com'
   s.author = 'Jesse Squires'

   s.source = { :git => 'https://github.com/jessesquires/PROJECT.git', :tag => s.version }
   s.source_files = 'Sources/*.swift'

   s.swift_version = '5.3'

   s.ios.deployment_target = '13.0'
   s.tvos.deployment_target = '13.0'
   s.watchos.deployment_target = '6.0'
   s.osx.deployment_target = '10.15'

   s.requires_arc = true
end
