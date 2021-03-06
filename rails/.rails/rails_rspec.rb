application "config.generators do |g|
      g.test_framework :rspec,
        :view_specs     => false,
        :request_specs  => false,
        :routing_specs  => false,
        :helper_specs   => false
    end"
application("config.generators.stylesheets = false")
application("config.generators.javascripts = false")
application("config.generators.helper = false")

# clean up rails defaults
remove_file 'public/images/rails.png'
run 'cp config/database.yml config/database.example'
append_file ".gitignore", "config/database.yml"

# gemfile
gsub_file "Gemfile", /(gem 'sass-rails',.*)/, '# \1'
gsub_file "Gemfile", /(gem 'coffee-rails',.*)/, '# \1'
gem "rspec-rails", :group => [:development, :test]

# forcing bundle before tasks provided by external gems
run "bundle install"

# prepare databases
rake "db:create", :env => 'development'

# rspec
generate "rspec:install"
append_file ".rspec", "--format documentation"
append_file ".rspec", "--require spec_helper"
append_file ".rspec", "\n"

rake "db:migrate", :env => 'development'

# commit to git
git :init
git :add => "."
git :commit => "-am 'omg! initial commit.'"

run "mvim"
