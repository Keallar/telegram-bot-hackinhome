require 'net/http'
require 'openssl'
require 'json'

module Bot
  class Authorization
    attr_reader :login, :password
    attr_accessor :authenticated

    def initialize(login, password)
      @login = login
      @password = password
    end

    def auth_to_module
      data = { login: @login, password: @password }
      json = JSON.generate(data)
      # Net::HTTP::Post

    end

    def auth_success
      @authenticated = true
    end

    def auth_failed
      @authenticated = false
    end
  end
end
