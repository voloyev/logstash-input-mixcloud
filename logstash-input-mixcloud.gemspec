Gem::Specification.new do |s|
  s.name          = 'logstash-input-mixcloud'
  s.version       = '0.1.2'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'Input plugin for logstash.'
  s.description   = 'It takes data from mixcloud and put it in place was configured by logstash.'
  s.homepage      = 'https://github.com/voloyev/logstash_input_mixcloud'
  s.authors       = ['Volodymyr Yevtushenko']
  s.email         = 'voloyev@vivaldi.net'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*', 'spec/**/*', 'vendor/**/*',
                '*.gemspec','*.md', 'CONTRIBUTORS',
                'Gemfile', 'LICENSE', 'NOTICE.TXT']
  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { 'logstash_plugin' => 'true', 'logstash_group' => 'input' }

  # Gem dependencies
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_runtime_dependency 'logstash-core-plugin-api', '~> 2.0'
  s.add_runtime_dependency 'logstash-codec-plain'
  s.add_runtime_dependency 'stud', '>= 0.0.22'
  s.add_development_dependency 'logstash-devutils', '>= 0.0.16'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-doc'
  s.add_development_dependency 'rubocop'
end
