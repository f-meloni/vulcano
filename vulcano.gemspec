
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vulcano/version"

Gem::Specification.new do |spec|
  spec.name          = "vulcano"
  spec.version       = Vulcano::VERSION
  spec.authors       = ["Franco Meloni"]
  spec.email         = ["franco.meloni91@gmail.com"]

  spec.summary       = %q{Swift Codable file genertator}
  spec.description   = %q{This script generates Swift Codable files from a given JSON file}
  spec.homepage      = "https://github.com/f-meloni/vulcano"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["vulcano"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
