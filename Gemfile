source 'https://rubygems.org'
ruby '2.1.1' # for heroku

gem 'rails',                               '~> 4.0'
gem 'globalize',                           '~> 4',       require: false
gem 'nokogiri',                                          require: false
gem 'pg',                                  '~> 0.17',    require: false
gem 'thin',                                '~> 1'        # https://devcenter.heroku.com/articles/rails3
gem 'haml',                                '~> 4'
gem 'devise',                              '~> 3.2.2'
gem 'activeadmin',                                        github: 'gregbell/active_admin', branch: 'master'
gem 'jquery-rails'
# gem 'turbolinks'         # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'omniauth',                            '~> 1.1',      require: false
gem 'omniauth-instagram',                  '~> 1'
gem 'omniauth-facebook',                   '1.5.1'
gem 'instagram',                           '0.10.0'
gem 'faraday',                             '0.8',         require: false
gem 'whenever',                                           require: false
gem 'airbrake',                            '~> 3.1'
gem 'friendly_id',                                        github: 'norman/friendly_id', branch: 'master'
gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'sitemap_generator',                   '3.4'
gem 'carrierwave',                         '~> 0.9'                      # for s3 upload of sitemap
gem 'fog',                                 '~> 1.11',     require: false # for s3 upload of sitemap
gem 'unf' # fog dependency for AWS encoding
gem 'bitfields',                           '~> 0.4',      require: false
gem 'awesome_print',                       '~> 1.1',      require: 'ap'
gem 'sendgrid'
gem 'meta-tags',                                          require: 'meta_tags'
gem 'mailchimp',                                          require: false
gem 'high_voltage',                        '~> 1'         # static pages
gem 'zendesk_api',                         '~> 1',        require: false
gem 'simple_form',                         '~> 3'
gem 'client_side_validations',                            github: 'bcardarella/client_side_validations',       branch: '4-0-beta'
gem 'client_side_validations-simple_form',                github: 'rogeriochaves/client_side_validations-simple_form', branch: 'master'
gem 'geocoder',                            '1.1.8'
gem 'gmaps4rails',                         '2.0.0.pre'
gem 'koala',                               '1.6.0'
gem 'delayed_job_active_record',           '4.0.0'
gem 'honeypot-captcha',                    '0.0.2'
gem 'progress_bar',                        '1.0.0',       require: false
gem 'fingerprintless'
gem 'custom_configuration'
gem 'font_assets' # for CORS issue in firefox/IE
gem 'paperclip', '~> 3.4.2' # version-locked by spree
gem 'delayed_paperclip'

group :console do
  gem 'gem_bench', github: 'pboling/gem_bench'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Gems used only for assets and not required in production environments by default.
gem 'sprockets',      '~> 2.11.0' # temporarily lock to 2.11.0 [https://github.com/sstephenson/sprockets/issues/540]
gem 'coffee-rails'
gem 'uglifier',        '>= 1.0.3'
gem 'jquery-ui-rails', '~> 4.1'
gem 'sass-rails',      '~> 4'
gem 'bootstrap-sass',  '~> 3'

group :development do
  gem 'better_errors',     '~> 1'
  gem 'binding_of_caller', '0.7.0', require: false # for better_errors gem live console
  gem 'guard-livereload',           require: false # live reload http://blog.55minutes.com/2013/01/lightning-fast-sass-reloading-in-rails-32/
  gem 'rack-livereload'
end

group :development, :test do
  gem 'rb-fsevent',                 require: false
  gem 'ffaker'
  gem 'rspec-rails',        '~> 2', require: false
  gem 'launchy',                    require: false
  gem 'spring',             '~> 1'
  gem 'spring-commands-rspec'
  gem 'pry-rails'
  gem 'pry-debugger'
end

group :test do
  gem 'capybara',           '~> 2.1',  require: false
  gem 'factory_girl_rails', '~> 4'
  gem 'sunspot_test',                  require: false
  gem 'sunspot_matchers',              require: false
  gem 'assert_difference',             require: false
  gem 'database_cleaner',              require: false
  gem 'simplecov',                     require: false
  gem 'selenium-webdriver', '~> 2.38', require: false
  gem 'codeclimate-test-reporter',     require: false
end

group :production do
  gem 'execjs',       '1.4.0',  require: false
  gem 'therubyracer', '0.12.0', require: false
  gem 'newrelic_rpm'
end

group :staging, :production do
  gem 'rails_12factor'
end

#gem 'spree',                    github: 'spree/spree',                       branch: '2-2-stable'
gem 'spree',                    github: 'ymek/spree',                       branch: '2-2-stable'
gem 'spree_gateway',            github: 'spree/spree_gateway',               branch: '2-2-stable'
#gem 'spree_auth_devise',        github: 'spree/spree_auth_devise',           branch: '2-2-stable'
gem 'spree_auth_devise',        github: 'ymek/spree_auth_devise',           branch: '2-2-stable'
#gem 'spree_auth_devise',        path: '/Users/_m/src/spree_auth_devise'
gem 'spree_i18n',               github: 'spree/spree_i18n',                  branch: '2-2-stable'
gem 'spree_google_merchant',    github: 'boombotix/spree_google_merchant', branch: '2-2-stable'
gem 'spree_html_email',         github: 'boombotix/spree-html-email',      branch: '2-2-stable'
gem 'spree_advanced_reporting', github: 'boombotix/spree_advanced_reporting'
gem 'braintree' # payment gateway
