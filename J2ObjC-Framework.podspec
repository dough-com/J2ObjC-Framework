@version = "1.0.2"

Pod::Spec.new do |s|
  s.name            = "J2ObjC-Framework"
  s.version         = @version
  s.summary         = "Frameworked version of J2ObjC"
  s.homepage        = "https://actor.im/"
  s.license         = { :type => 'MIT', :file => 'LICENSE' }
  s.author          = { "Actor LLC" => "steve@actor.im" }
  s.source          = { :git => "https://github.com/dough-com/J2ObjC-Framework.git", :tag => "v#{s.version}" }

  s.platform        = :ios, "8.0"
  s.requires_arc    = true

  s.frameworks      = 'Security'
  s.libraries       = 'icucore', 'z'

  s.prepare_command = <<-CMD
      Scripts/download.sh #{@version} 6f2f45b323ef92cc8d1b13dd789aebd1ab87562f
  CMD

  s.preserve_paths = 'Frameworks/j2objc.framework', 'dist', 'install.sh'
  s.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/J2ObjC-Framework/Frameworks"'
  }

  # s.vendored_frameworks = 'dist/frameworks/*.framework'

end
