# frozen_string_literal: true

require_relative "todoer/version"
require_relative "todoer/task"
require_relative "todoer/client"

module Todoer
  class Error < StandardError; end

  class << self
    def configure
      @config = Configuration.new
      yield(@config)
    end

    def configuration
      @config
    end
  end

  class Configuration
    attr_accessor :todos_host
  end
end
