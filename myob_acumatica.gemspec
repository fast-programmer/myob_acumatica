# frozen_string_literal: true

require_relative 'lib/myob_acumatica/version'

Gem::Specification.new do |spec|
  spec.name = 'myob_acumatica'
  spec.version = MyobAcumatica::VERSION
  spec.authors = ['Adam Mikulasev']
  spec.email = ['adammikulas@gmail.com']

  spec.summary = 'Ruby client for MYOB Acumatica'
  spec.homepage = 'https://github.com/fast-programmer/myob_acumatica'
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.6'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/fast-programmer/myob_acumatica'
  spec.metadata['changelog_uri'] = 'https://github.com/fast-programmer/myob_acumatica/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'byebug', '~> 11.1'
  spec.add_development_dependency 'dotenv', '~> 3.1'
  spec.add_development_dependency 'pry', '~> 0.15'
  spec.add_development_dependency 'puma', '~> 6.6'
  spec.add_development_dependency 'rackup', '~> 2.2'
  spec.add_development_dependency 'rerun', '~> 0.14'
  spec.add_development_dependency 'rubocop', '~> 1.71'
  spec.add_development_dependency 'sinatra', '~> 4.1'
  spec.add_development_dependency 'yard', '~> 0.9'
end
