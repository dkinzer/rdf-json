source "https://rubygems.org"

gemspec

gem "rdf",      :git => "git://github.com/ruby-rdf/rdf.git", :branch => "develop"

group :development do
  gem "rdf-spec", :git => "git://github.com/ruby-rdf/rdf-spec.git", :branch => "develop"
end

group :debug do
  gem "wirble"
  gem "redcarpet", :platforms => :ruby
  gem "debugger", :platforms => [:mri_19, :mri_20]
  gem "ruby-debug", :platforms => :jruby
end

platforms :rbx do
  gem 'rubysl', '~> 2.0'
  gem 'rubinius', '~> 2.0'
  gem 'json'
end
