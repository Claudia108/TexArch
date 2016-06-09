require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TexArch
  class Application < Rails::Application

  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV.fetch("aws_bucket"),
      access_key_id: ENV.fetch("aws_access_key_id"),
      secret_access_key: ENV.fetch("aws_secret_access_key"),
    },
    s3_region: "us-east-1",
  }

    config.active_record.raise_in_transactional_callbacks = true
  end
end
