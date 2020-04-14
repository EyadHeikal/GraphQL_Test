# Uncomment the next line to define a global platform for your project
platform :ios, '13.4'

target 'GraphQL_Test' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GraphQL_Test
  pod "Apollo"
  pod "Apollo/SQLite"
  pod "Apollo/WebSocket"

end


#--------------------------------------

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.4'
    end
  end
end

#--------------------------------------
#--------------------------------------

dynamic_frameworks = []
# make all the other frameworks into static frameworks by overriding the static_framework? function to return true
pre_install do |installer|
  installer.pod_targets.each do |pod|
    if !dynamic_frameworks.include?(pod.name)
      puts "Overriding the static_framework? method for #{pod.name}"
      def pod.static_framework?;
      true
    end
  end
end
end

#--------------------------------------
#--------------------------------------
