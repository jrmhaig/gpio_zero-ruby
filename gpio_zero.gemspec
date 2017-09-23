Gem::Specification.new do |s|
  s.name = 'gpio_zero'
  s.version = '0.0.1'
  s.date = Time.now.strftime("%Y-%m-%d")
  s.summary = 'GPIO zero'
  s.description = 'Simple GPIO interface for the Raspberry Pi'
  s.author = ['Joe Haig']
  s.email = 'josephhaig@gmail.com'
  s.files = Dir['README.md', 'lib/**/*.rb']
  s.homepage = 'https://github.com/jrmhaig/gpio_zero-ruby'
  s.license = 'MIT'
  s.add_runtime_dependency 'ffi', '~> 1.9.18'
  s.add_development_dependency 'rspec', '~> 3.6.0'
  s.add_development_dependency 'pry'
end
