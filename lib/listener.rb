require 'telegram/bot'
Dir[File.dirname(__FILE__) + '/lib/assets/*.rb'].each { |file| require_relative file }

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
      rescue => e
        @bot.logger.error(e.message)
        @bot.logger.error(e.backtrace)
      end
    end

    def message_call
      case @message.text
      when '/start'
        kb = [Bot::KeyboardButton::AUTHORIZATION]
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
        @bot.logger.info('Bot has been started working')
        @bot.api.send_message(chat_id: @message.chat.id, text: 'Добро пожаловать!', reply_markup: markup)

      when 'Авторизация'
        @bot.api.send_message(chat_id: @message.from.id, text: "Авторизация")

      when 'Главное меню'
        @bot.api.send_message(chat_id: @message.from.id, text: "Главное меню")

      when 'Преподаватели'
        @bot.api.send_message(chat_id: @message.from.id, text: "Преподаватели")

      when "Назад"
        @bot.api.send_message(chat_id: @message.from.id, text: "Назад")

      else
        @bot.api.send_message(chat_id: @message.from.id, text: "Жопа")

      end
    end

    def query_call
      # case @message.data
      # when
      # end
    end
  end
end
