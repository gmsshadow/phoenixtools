require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'nokogiri'
require 'open-uri'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

File.open(File.expand_path('../../log/phoenixtools.log', __FILE__), 'w+') do |f|
	f.write "*** #{Time.now} ***\n"
end

LOG = Logger.new(File.expand_path('../../log/phoenixtools.log', __FILE__))

module Phoenixtools
  class Application < Rails::Application
    # Transitional setting for Rails 5.x upgrade:
    # keep Rails 4 behavior so existing optional belongs_to relations do not break.
    config.active_record.belongs_to_required_by_default = false

    config.generators do |g|
      g.hidden_namespaces << :test_unit << :erb
      g.test_framework :rspec
    end
  end
end
