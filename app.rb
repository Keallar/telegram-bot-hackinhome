require 'telegram/bot'
require 'dotenv'
require 'logger'
require_relative 'lib/listener'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require_relative file }

class TelegramBotApp
  TOKEN = ENV['TOKEN']
  LOGGER = Logger.new($stderr)

  def initialize
    @client = Telegram::Bot::Client.new(TOKEN, logger: LOGGER)

    @client.run do |bot|
      listener = Bot::Listener.new(bot)

      bot.listen do |message|
        Thread.start(message) do |rqst|
          listener.call(rqst)
        end
      end
    end
  end
end
