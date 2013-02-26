Gem::Specification.new do |s|
  s.name        = 'when-files-change'
  s.version     = '0.1'
  s.authors     = ['Adam Sanderson']
  s.email       = ['netghost@gmail.com']
  s.homepage    = 'https://github.com/adamsanderson/when-files-change'
  
  s.summary     = 'When files change, do something.'
  s.description = 'Whenever files in your working directory change, execute a command, such as "rake test".'

  s.add_dependency 'listen', '~> 0.7'

  s.files        = Dir.glob('{bin,lib}/**/*') + ["README.markdown"]
  s.executable   = 'when-files-change'
  s.require_path = 'lib'
end