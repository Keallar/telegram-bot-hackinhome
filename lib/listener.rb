require 'telegram/bot'

module Bot
  class Listener
    attr_reader :bot, :message

    def initialize(bot)
      @bot = bot
    end

    def call(message)
      @message = message

      begin
        case @message
        when Telegram::Bot::Types::CallbackQuery
          query_call
        when Telegram::Bot::Types::Message
          message_call
        end
      rescue
      end
    end

    def message_call
      case @message.data

      end
    end

    def query_call

    end
  end
end
