require 'telegram/bot'
require 'dotenv'
require 'sinatra'
require 'logger'
require 'sinatra/activerecord'
Dir[File.dirname(__FILE__) + '/lib/*'].each { |file| require file }

class TelegramBotApp
  TOKEN = ENV['BOT_SECRET_TOKEN']
  LOGGER = Logger.new($stderr)

  def initialize
    @client = Telegram::Bot::Client.new(TOKEN, logger: LOGGER)

    begin
      @client.run do |bot|
        bot.logger.info('Bot started successfully')
        listener = Bot::Listener.new(bot)

        bot.listen do |message|
          Thread.start(message) do |rqst|
            listener.call(rqst)
          end
        end
      end
    rescue => e
      bot.logger.error(e.message)
    end
  end
end
