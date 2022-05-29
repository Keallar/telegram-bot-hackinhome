require 'telegram/bot'
require 'json'
require_relative 'base_bot'
require_relative 'request'
require_relative 'objects/subject'
require_relative 'inline_button_generator'

module Bot
  class SubjectsController < BaseBot
    attr_accessor :arr_subjects

    def listen(message)
      if message.data.split('_').first == 'subject'
        @arr_subjects.each do |subject|
          @bot.api.send_message(chat_id: message.from.id, text: "#{subject.id}. #{subject.name}, #{subject.url}, #{subject.module_start_date}, #{subject.module_end_date}") if message.data == subject.callback_data
        end
      end
    end

    def subjects_list(message)
      response = Request.send_data(@bot, 'subjects')
      parse_subjects(response)
      ikb = []
      @arr_subjects.each do |subject|
        @bot.logger.info "subject: #{subject.name}"
        ikb << subject.inline_button
      end
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send from subjects controller')
      @bot.api.send_message(chat_id: message.from.id, text: "Список предметов", reply_markup: inline_markup)
    end

    private

    def parse_subjects(json)
      @arr_subjects = []
      button = []
      json.each do |h|
        @bot.logger.info "#{h}"
        button << Bot::InlineButtonGenerator.create('subject', h)
        button << Bot::InlineButtonGenerator.callback_data('subject', h)
        @arr_subjects << Subject.new(h, button)
      end
    end
  end
end
