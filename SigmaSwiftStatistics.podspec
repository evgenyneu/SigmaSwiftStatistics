Pod::Spec.new do |s|
  s.name        = "SigmaSwiftStatistics"
  s.version     = "7.0.2"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/evgenyneu/SigmaSwiftStatistics"
  s.summary     = "A collection of functions for statistical calculation written Swift for iOS, macOS, watchOS and tvOS."
  s.description  = <<-DESC
                   This library is a collection of functions that perform statistical calculations: average, covariance, max, min, pearson, percentile, standard deviation, sum, variance and others.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/evgenyneu/SigmaSwiftStatistics.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/evgenyneu/SigmaSwiftStatistics/master/Graphics/logo.png"
  s.source_files = "SigmaSwiftStatistics/*.swift"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
end