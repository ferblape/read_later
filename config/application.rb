require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReadLater
  class Application < Rails::Application
    config.time_zone = 'UTC'

    config.api_only = true

    config.generators do |g|
      g.orm             :active_record
      g.test_framework  :rspec, fixtures: false, view_spec: false,
                                helper_specs: false, routing_specs: false,
                                controller_specs: false, request_specs: true
    end

    # Autoloading
    config.autoload_paths += [
      "#{config.root}/lib/validators",
    ]
  end
end
