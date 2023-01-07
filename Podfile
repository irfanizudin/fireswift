# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'firebase-swift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for firebase-swift
  pod 'FirebaseCore'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'FirebaseFirestoreSwift'


end

post_install do |installer|
     installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
             config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
             config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
             config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
         end
     end
  end

# Fix Xcode 14 warnings like:
# warning: Run script build phase '[CP] Copy XCFrameworks' will be run during every build because it does not specify any outputs. To address this warning, either add output dependencies to the script phase, or configure it to run in every build by unchecking "Based on dependency analysis" in the script phase. (in target 'ATargetNameHere' from project 'YourProjectName')
# Ref.: https://github.com/CocoaPods/CocoaPods/issues/11444
post_integrate do |installer|
  main_project = installer.aggregate_targets[0].user_project
  pods_project = installer.pods_project
  targets = main_project.targets + pods_project.targets
  targets.each do |target|
    run_script_build_phases = target.build_phases.filter { |phase| phase.is_a?(Xcodeproj::Project::Object::PBXShellScriptBuildPhase) }
    cocoapods_run_script_build_phases = run_script_build_phases.filter { |phase| phase.name.start_with?("[CP]") }
    cocoapods_run_script_build_phases.each do |run_script|
      next unless (run_script.input_paths || []).empty? && (run_script.output_paths || []).empty?
      run_script.always_out_of_date = "1"
    end
  end
  main_project.save
  pods_project.save
end