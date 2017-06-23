require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Stackoverflow
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.test_framework false
    end
  end
end
