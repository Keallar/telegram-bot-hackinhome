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
      @subject = Bot::Subject.new(@bot)
      @schedule = Bot::Schedule.new(@bot)
      @teacher = Bot::Teacher.new(@bot)
      @proposal = Bot::Proposal.new(@bot)
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
      if @auth.authenticated
        parse_message
      else
        case @message.text
        when '/start'
          if !@auth.authenticated
            kb = [Bot::KeyboardButton::AUTHORIZATION]
            markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
            @bot.logger.info('Bot has been started working')
            @bot.api.send_message(chat_id: @message.chat.id, text: 'Добро пожаловать!', reply_markup: markup)
          else
            kb = [[Bot::KeyboardButton::TEACHERS, Bot::KeyboardButton::GET_SCHEDULE],
                  [Bot::KeyboardButton::GET_NAVIGATION, Bot::KeyboardButton::GET_SUBJECTS],
                  [Bot::KeyboardButton::PROPOSAL, Bot::KeyboardButton::DEBT]]
            markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
            @bot.api.send_message(chat_id: @message.chat.id, text: "Авторизация прошла успешно", reply_markup: markup)
          end

        when 'Авторизация'
          @auth.auth_to_module
          if @auth.authenticated
            kb = [[Bot::KeyboardButton::TEACHERS, Bot::KeyboardButton::GET_SCHEDULE],
                  [Bot::KeyboardButton::GET_NAVIGATION, Bot::KeyboardButton::GET_SUBJECTS],
                  [Bot::KeyboardButton::PROPOSAL, Bot::KeyboardButton::DEBT]]
            markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
            @bot.logger.info('Авторизация')
            @bot.api.send_message(chat_id: @message.chat.id, text: "Авторизация прошла успешно", reply_markup: markup)
          else
            @bot.api.send_message(chat_id: @message.from.id, text: "Ошибка при аторизации")
          end
        end
      end
    end

    def query_call
      if @auth.authenticated
        parse_query
      end
    end

    private

    def parse_query
      case @message.data.split('_').first
      when 'navigation'
        @navigation.listen(@message, data)
      when 'corpus'
        @navigation.listen(@message, data)
      when 'teacher'
        @teacher.listen(@message, data)
      when 'subject'
        @subject.listen(@message, data)
      when 'schedule'
        @schedule.listen(@message, data)
      when 'back'
        kb = [[Bot::KeyboardButton::TEACHERS, Bot::KeyboardButton::GET_SCHEDULE],
              [Bot::KeyboardButton::GET_NAVIGATION, Bot::KeyboardButton::GET_SUBJECTS],
               [Bot::KeyboardButton::PROPOSAL, Bot::KeyboardButton::DEBT]]
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: true)
        @bot.logger.info('Назад')
        # TODO: delete previous message
        @bot.api.send_message(chat_id: @message.from.id, text: "Назад", reply_markup: markup)
      end
    end

    def parse_message
      case @message.text
      when "Навигация по ВУЗу"
        @navigation.send_buttons_new_stages(@message)
      when 'Поиск преподавателя'
        @bot.api.send_message(chat_id: @message.from.id, text: "Преподаватель")
      when 'Изучаемые предметы'
        @subject.subjects_list(@message)
      when "Заявка"
        @proposal.faqs_all(@message)
      when "Расписание"
        @bot.api.send_message(chat_id: @message.from.id, text: "Расписание")
      when "Долги"
        @bot.api.send_message(chat_id: @message.from.id, text: "Долги")
      # when 'Староста'
      #   @bot.api.send_message(chat_id: @message.from.id, text: "Староста")
      end
    end
  end
end
