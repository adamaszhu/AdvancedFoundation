Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "AdvancedFoundation"
s.summary = "AdvancedFoundation contains utility functions built on top of Foundation framework."
s.requires_arc = true
s.version = "1.9.9"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Adamas Zhu" => "developer@adamaszhu.com" }
s.homepage = "https://github.com/adamaszhu/AdvancedFoundation"
s.source = { :git => "https://github.com/adamaszhu/AdvancedFoundation.git",
             :tag => "#{s.version}" }
s.framework = "Foundation"
s.source_files = "AdvancedFoundation/**/*.{swift}"
s.resources = "AdvancedFoundation/**/*.{strings}"
s.swift_version = "5"

end
