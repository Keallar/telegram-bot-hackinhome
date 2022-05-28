require 'telegram/bot'
require_relative 'assets/keyboard_button'
require_relative 'assets/inline_button'
require_relative 'users/authorization'

module Bot
  class Listener
    attr_reader :bot, :message

    def initialize(bot)
      @bot = bot
      @auth = Bot::Authorization.new(@bot)
      @navigation = Bot::Navigation.new(@bot)
      @lesson = Bot::Lesson.new(@bot)
      @schedule = Bot::Schedule.new(@bot)
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
        if !@auth.authenticated
          kb = [Bot::KeyboardButton::AUTHORIZATION]
          markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
          @bot.logger.info('Bot has been started working')
          @bot.api.send_message(chat_id: @message.chat.id, text: 'Добро пожаловать!', reply_markup: markup)
        else
          kb = [[Bot::KeyboardButton::TEACHERS, Bot::KeyboardButton::GET_SCHEDULE],
                [Bot::KeyboardButton::GET_NAVIGATION, Bot::KeyboardButton::GET_LINKS_ON_LESSONS]]
          markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
          @bot.api.send_message(chat_id: @message.chat.id, text: "Авторизация прошла успешно", reply_markup: markup)
        end

      when 'Авторизация'
        if @auth.authenticated
          kb = [[Bot::KeyboardButton::TEACHERS, Bot::KeyboardButton::GET_SCHEDULE],
                [Bot::KeyboardButton::GET_NAVIGATION, Bot::KeyboardButton::GET_LINKS_ON_LESSONS]]
          markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
          @bot.logger.info('Авторизация')
          @bot.api.send_message(chat_id: @message.chat.id, text: "Авторизация прошла успешно", reply_markup: markup)
        else
          @bot.api.send_message(chat_id: @message.from.id, text: "Ошибка при аторизации")
        end

      when "Навигация по ВУЗу"
        @navigation.send_buttons(@message)
      when 'Преподаватели'
        @bot.api.send_message(chat_id: @message.from.id, text: "Преподаватели")
      when 'Главное меню'
        @bot.api.send_message(chat_id: @message.from.id, text: "Главное меню")
      when "Назад"
        @bot.api.send_message(chat_id: @message.from.id, text: "Назад")
      else
        @bot.api.send_message(chat_id: @message.from.id, text: "Жопа")
      end
    end

    def query_call
      parse_query(@message.data)
    end

    private

    def parse_query(data)
      case data.split('_').first
      when 'navigation'
        @navigation.listen(@message, data)
      when 'lesson'
        @lesson.listen(data)
      when 'schedule'
        @schedule.listen(data)
      end
    end

    def parse_message(message); end
  end
end
