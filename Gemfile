source 'https://rubygems.org'

# Ruby Version
# ruby "2.2.1"

# Adding Sinatra Drivers
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'

# Adding thin gem as advised
gem 'thin'

# Adding ActiveRecord and Database Components
gem 'activerecord'
gem 'activesupport', require: 'activesupport/all'
gem 'sinatra-activerecord'

# Adding Database elements
gem 'pg'

# Adding rake for management
gem 'rake'

# Adding rspec for running unit testing
gem 'rspec'

# Adding byebug
gem 'byebug'

# Adding capybara
gem 'capybara'

# Adding time difference
gem 'time_diff'

# paginate
gem 'will_paginate', '~> 3.0.6'

# Adding bcrypt
gem 'bcrypt', '~> 3.1', '>= 3.1.7'

# Adding other gems
gem 'bootstrap-sass', '~> 3.3.6'
gem 'figaro'
gem 'clearance'
gem 'faker

group :test, :production do
  # Adding shotgun for local web hosting
  gem 'shotgun'
end

group :development do
  # Heroku
  # ==================
  gem 'rails_12factor' # Heroku Gem Supports
  gem 'puma' # Using puma for
end
