Pod::Spec.new do |s|
  s.name        = "SigmaSwiftStatistics"
  s.version     = "1.0.8"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/evgenyneu/SigmaSwiftStatistics"
  s.summary     = "A collection of functions for statistical calculation written Swift."
  s.description  = <<-DESC
                   This library is a collection of functions that perform statistical calculations.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/evgenyneu/SigmaSwiftStatistics.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/evgenyneu/SigmaSwiftStatistics/master/Graphics/logo.png"
  s.source_files = "SwiftStatistics/*.swift"
  s.ios.deployment_target = "8.0"
end