Pod::Spec.new do |s|
  s.name        = "SigmaSwiftStatistics"
  s.version     = "1.1.0"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/evgenyneu/SigmaSwiftStatistics"
  s.summary     = "A collection of functions for statistical calculation written Swift for iOS and OS X."
  s.description  = <<-DESC
                   This library is a collection of functions that perform statistical calculations: average, covariance, max, min, pearson, standard deviation, sum, variance.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/evgenyneu/SigmaSwiftStatistics.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/evgenyneu/SigmaSwiftStatistics/master/Graphics/logo.png"
  s.source_files = "SigmaSwiftStatistics/*.swift"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
end