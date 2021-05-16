# frozen_string_literal: true

require_relative "lc_rails_logging/version"
require "google/cloud/logging"

module LcRailsLogging
  class << self
    attr_accessor :configuration
  end
  class Error < StandardError; end

  # Your code goes here...
  def self.send_log(request, user)
    begin
      logging = Google::Cloud::Logging.new
      app_name = self.configuration.app_name
      entry = logging.entry
      entry.payload = "AccessLog from #{app_name}"
      entry.log_name = "ip_address"
      entry.resource.type = 'gae_app'
      entry.labels[:app_name] = app_name
      entry.labels[:url] = request.url
      entry.labels[:userAgent] = request.user_agent
      entry.labels[:ip_address] = request.remote_ip
      entry.labels[:uid] = user.uid

      logging.write_entries entry
    rescue => exception
      puts exception
    end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :app_name

    def initialize
      @app_name = 'default app'
    end
  end
end
