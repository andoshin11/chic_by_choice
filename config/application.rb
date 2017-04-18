require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ECSample
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :rspec, view_specs: false, helper_specs: true, fixture: true, integration_tool: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    config.browserify_rails.commandline_options = [
      '-t [ babelify --presets [ latest ] --plugins [ add-module-exports ] ]',
      '-t vueify',
    ]
    Rails.application.config.assets.paths << Rails.root.join('node_modules')
  end
end
