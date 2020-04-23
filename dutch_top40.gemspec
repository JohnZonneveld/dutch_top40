require_relative 'lib/dutch_top40/version'

Gem::Specification.new do |spec|
  spec.name          = "dutch_top40"
  spec.version       = DutchTop40::VERSION
  spec.authors       = ["raspimeteo"]
  spec.email         = ["jjczon@gmail.com"]

  spec.summary       = %q{CLI scraper for the top40.nl website.}
  spec.description   = %q{Scrapes the listing of songs, as wel some artist info, weeks in the top 40 and highest rank reached so far.}
  spec.homepage      = "https://github.com/raspimeteo/dutch_top40"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/raspimeteo/dutch_top40"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
  
end
