# frozen_string_literal: true

require_relative "lib/lc_rails_logging/version"

Gem::Specification.new do |spec|
  spec.name          = "lc_rails_logging"
  spec.version       = LcRailsLogging::VERSION
  spec.authors       = ["madoka.igarashi"]
  spec.email         = ["madomado.hoko@icloud.com"]

  spec.summary       = "LA railsプロジェクトのログ用gem"
  spec.description   = "ユーザーのIPアドレスなどを取得するために作成されたgemです。"
  spec.homepage      = "https://github.com/LiberalArtsUniversity/lc_rails_logging"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/LiberalArtsUniversity/lc_rails_logging"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/LiberalArtsUniversity/lc_rails_logging"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
