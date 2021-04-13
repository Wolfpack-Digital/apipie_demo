# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = 'ApipieDemo'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/apipie'
  config.show_all_examples       = true
  config.translate               = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"

  config.authenticate = proc do
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['APIPIE_USERNAME'] && password == ENV['APIPIE_PASSWORD']
    end
  end
end
