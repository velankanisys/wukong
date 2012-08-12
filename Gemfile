source 'http://rubygems.org'

gemspec

gem 'gorillib',    :path => '../gorillib'

group :development do
  gem 'oj',          ">= 1.2",   :platform => :ruby
  gem 'json',                    :platform => :jruby
end

group :docs do
  gem 'RedCloth',    ">= 4.2", :require => "redcloth"
  gem 'redcarpet',   ">= 2.1"
end

# Gems for testing and coverage
group :test do
  gem 'simplecov',   ">= 0.5", :platform => :ruby_19
end

# Gems you would use if hacking on this gem (rather than with it)
group :support do
  gem 'pry'
  gem 'perftools.rb', :platform => :mri
  #
  gem 'guard',       ">= 1.0"
  gem 'guard-rspec', ">= 0.6"
  gem 'guard-yard'
  if RUBY_PLATFORM.include?('darwin')
    gem 'rb-fsevent', ">= 0.9"
  end
end
