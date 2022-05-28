require 'telegram/bot'
require 'uri'
require 'net/http'
require 'open-uri'
require_relative 'base_bot'

module Bot
  class Navigation < BaseBot

    def listen(message, data)
      case data
      when 'navigation_1_stage_new'
        send_stage(message, 1)
      when 'navigation_2_stage_new'
        send_stage(message, 2)
      when 'navigation_3_stage_new'
        send_stage(message, 3)
      when 'navigation_4_stage_new'
        send_stage(message, 4)
      when 'navigation_5_stage_new'
        send_stage(message, 5)
      when 'navigation_6_stage_new'
        send_stage(message, 6)
      when 'navigation_7_stage_new'
        send_stage(message, 7)
      when 'navigation_8_stage_new'
        send_stage(message, 8)
      when 'navigation_1_stage_old'
      when 'navigation_2_stage_old'
      when 'navigation_3_stage_old'
      when 'navigation_4_stage_old'
      when 'navigation_5_stage_old'
      when 'navigation_6_stage_old'
      when 'navigation_7_stage_old'
      when 'navigation_8_stage_old'
      when 'navigation_transition'

      end
    end

    def send_buttons_corpuses(message)
      ikb = [Bot::InlineButton::Corpus::NEW_CORPUS, Bot::InlineButton::Corpus::OLD_CORPUS, Bot::InlineButton::Corpus::TRANSITION]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_markup: ikb)
      @bot.logger.info('Send inline navigation corpuses')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    def send_buttons_stages(message)
      ikb = [Bot::InlineButton::Navigation::FIRST_STAGE_NEW, Bot::InlineButton::Navigation::SECOND_STAGE_NEW,
             Bot::InlineButton::Navigation::THIRD_STAGE_NEW,  Bot::InlineButton::Navigation::FOURTH_STAGE_NEW,
             Bot::InlineButton::Navigation::FIFTH_STAGE_NEW,  Bot::InlineButton::Navigation::SIXTH_STAGE_NEW,
             Bot::InlineButton::Navigation::SEVENTH_STAGE_NEW,  Bot::InlineButton::Navigation::EIGHTH_STAGE_NEW]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation stages')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    private

    def send_stage(message, stage)
      @bot.api.send_document(chat_id: message.from.id, document: document(stage))
    end

    def document(num)
      if num == 1
        "https://vstankine.ru/sites/default/files/novyy_korpus_#{num}_etazh_12_1.pdf"
      elsif num == 5 || num == 6 || num == 7 || num == 9
        "https://vstankine.ru/sites/default/files/novyy_korpus_#{num}_etazh.pdf"
      else
        "https://vstankine.ru/sites/default/files/novyy_korpus_#{num}_etazh_12.pdf"
      end
    end

    def stage_new
      ikb = [Bot::InlineButton::Navigation::FIRST_STAGE_NEW, Bot::InlineButton::Navigation::SECOND_STAGE_NEW,
             Bot::InlineButton::Navigation::THIRD_STAGE_NEW,  Bot::InlineButton::Navigation::FOURTH_STAGE_NEW,
             Bot::InlineButton::Navigation::FIFTH_STAGE_NEW,  Bot::InlineButton::Navigation::SIXTH_STAGE_NEW,
             Bot::InlineButton::Navigation::SEVENTH_STAGE_NEW,  Bot::InlineButton::Navigation::EIGHTH_STAGE_NEW]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation stages new')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    def stage_old
      ikb = [Bot::InlineButton::Navigation::FIRST_STAGE_OLD, Bot::InlineButton::Navigation::SECOND_STAGE_OLD,
             Bot::InlineButton::Navigation::THIRD_STAGE_OLD,  Bot::InlineButton::Navigation::FOURTH_STAGE_OLD,
             Bot::InlineButton::Navigation::FIFTH_STAGE_OLD,  Bot::InlineButton::Navigation::SIXTH_STAGE_OLD,
             Bot::InlineButton::Navigation::SEVENTH_STAGE_OLD, Bot::InlineButton::Navigation::EIGHTH_STAGE_OLD]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation stages old')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    def transition
      ikb = [Bot::InlineButton::Navigation::TRANSITION]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation transition')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end
  end
end
