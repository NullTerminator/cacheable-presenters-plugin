lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'cacheable_presenters_plugin'
  spec.version       = '0.0.3'
  spec.authors       = ['Chris Marques']
  spec.email         = ['chris@geotix.com']

  spec.summary       = %q{Allows for russian doll / fragment cacheing of POM objects' views.}
  spec.homepage      = 'http://github.com/mynorth/cacheable_presenters_plugin'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency 'rspec', '~> 3.0'
end
