# frozen_string_literal: true

require_relative "lib/devise_wallet/version"

Gem::Specification.new do |spec|
  spec.name          = "devise_wallet"
  spec.version       = DeviseWallet::VERSION
  spec.authors       = ["Lincoln Anders"]
  spec.email         = ["lincolnanders5@gmail.com"]

  spec.summary       = "Devise Wallet Extension, for authenticating crypto wallets."
  spec.homepage      = "http://github.com/lincolnanders5/devise_wallet"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/lincolnanders5/devise_wallet"
  spec.metadata["changelog_uri"] = "http://github.com/lincolnanders5/devise_wallet/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
