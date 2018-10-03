
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "clamd_for_centos/version"

Gem::Specification.new do |spec|
  spec.name          = "clamd_for_centos"
  spec.version       = ClamdForCentos::VERSION
  spec.authors       = ["naveen"]
  spec.email         = ["navkumar2245@gmail.com"]

  spec.summary       = %q{Configure clamav on centos server}
  spec.description   = %q{helper for Clamby gem on centos server run this in console ClamdForCentos.setup}
  spec.homepage      = "https://github.com/navkumar2245/clamby-centos"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency 'clamby', '~> 1.4'
  spec.add_development_dependency 'clamby', '~> 1.4'

end
