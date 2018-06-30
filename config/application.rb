require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UserFeedApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # default_url_options[:host] = "user-feed-app.test"
    # config.action_cable.allowed_request_origins = ["https://#{default_url_options[:host]}"]
    # config.action_cable.url = "wss://#{default_url_options[:host]}/cable"
    config.action_cable.allowed_request_origins = ["http://localhost:3000"]
    config.action_cable.url = "ws://localhost:3000/cable"

    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = "Pacific Time (US & Canada)"
    config.force_ssl = false
    config.ssl_options = { hsts: { subdomains: true } }
    default_url_options[:protocol] = "https://"
    config.active_support.escape_html_entities_in_json = true
    config.active_support.test_order = :random
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
      g.helper false
      g.assets false
      g.view_specs false
    end

    config.exceptions_app = self.routes
    config.active_job.queue_adapter = :delayed_job
    config.assets.paths << Rails.root.join("vendor", "assets")
  end
end
