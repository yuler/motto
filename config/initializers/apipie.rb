# The Apipie config.
# refs: https://github.com/Apipie/apipie-rails?tab=readme-ov-file#configuration-reference
Apipie.configure do |config|
  config.app_name                = "Motto"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apipie"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.validate                = false
end
