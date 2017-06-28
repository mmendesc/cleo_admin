require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CleoAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('vendor', 'assets', 'plugins')

    config.time_zone = 'Brasilia'
    config.i18n.default_locale = "pt-BR"
    config.i18n.available_locales = [:en, "pt-BR"]
    config.encoding = "utf-8"
    config.active_record.time_zone_aware_types = [:datetime, :time]
  end
end
