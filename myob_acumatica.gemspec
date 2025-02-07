# frozen_string_literal: true

require_relative 'lib/myob_acumatica/version'

Gem::Specification.new do |spec|
  spec.name = 'myob_acumatica'
  spec.version = MyobAcumatica::VERSION
  spec.authors = ['Adam Mikulasev']
  spec.email = ['adammikulas@gmail.com']

  spec.summary = 'Ruby client for the MYOB Acumatica HTTP API'
  spec.homepage = 'https://www.myob.com/au/erp-software/products/myob-acumatica'
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

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'puma'
  spec.add_development_dependency 'rackup'
  spec.add_development_dependency 'rerun'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'sinatra'
end
