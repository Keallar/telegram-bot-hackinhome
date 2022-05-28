require 'telegram/bot'
require 'uri'
require 'net/http'
require 'open-uri'
require_relative 'assets/inline_button'
require_relative 'assets/keyboard_button'
# require 'RMagick'
require_relative 'base_bot'

module Bot
  class Navigation < BaseBot
    # include Magick

    def listen(message, data)
      case data
      when 'navigation_1_stage_new'
        send_stage(message, 1, 'new')
      when 'navigation_2_stage_new'
        send_stage(message, 2, 'new')
      when 'navigation_3_stage_new'
        send_stage(message, 3, 'new')
      when 'navigation_4_stage_new'
        send_stage(message, 4, 'new')
      when 'navigation_5_stage_new'
        send_stage(message, 5, 'new')
      when 'navigation_6_stage_new'
        send_stage(message, 6, 'new')
      when 'navigation_7_stage_new'
        send_stage(message, 7, 'new')
      when 'navigation_8_stage_new'
        send_stage(message, 8, 'new')
      when 'navigation_1_stage_old'
        send_stage(message, 1, 'old')
      when 'navigation_2_stage_old'
        send_stage(message, 2, 'old')
      when 'navigation_3_stage_old'
        send_stage(message, 3, 'old')
      when 'navigation_4_stage_old'
        send_stage(message, 4, 'old')
      when 'navigation_5_stage_old'
        send_stage(message, 5, 'old')
      when 'navigation_6_stage_old'
        send_stage(message, 6, 'old')
      when 'navigation_7_stage_old'
        send_stage(message, 7, 'old')
      when 'navigation_8_stage_old'
        send_stage(message, 8, 'old')
      when 'navigation_transition'
        send_stage(message, 0, 'transition')
      when 'corpus_new'
        send_buttons_new_stages(message)
      when 'corpus_old'
        send_buttons_old_stages(message)
      when 'corpus_transition'
        send_buttons_transition_stage(message)
      end
    end

    def send_buttons_new_stages(message)
      ikb = [Bot::InlineButton::Navigation::FIRST_STAGE_OLD, Bot::InlineButton::Navigation::SECOND_STAGE_OLD,
             Bot::InlineButton::Navigation::THIRD_STAGE_OLD,  Bot::InlineButton::Navigation::FOURTH_STAGE_OLD,
             Bot::InlineButton::Navigation::FIFTH_STAGE_OLD,  Bot::InlineButton::Navigation::SIXTH_STAGE_OLD,
             Bot::InlineButton::Navigation::SEVENTH_STAGE_OLD,  Bot::InlineButton::Navigation::EIGHTH_STAGE_OLD,
             Bot::InlineButton::BACK]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation stages')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end


    # def send_buttons_corpuses(message)
    #   ikb = [Bot::InlineButton::Corpus::NEW_CORPUS, Bot::InlineButton::Corpus::OLD_CORPUS,
    #          Bot::InlineButton::Corpus::TRANSITION, Bot::InlineButton::BACK]
    #   inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_markup: ikb)
    #   @bot.logger.info('Send inline navigation corpuses')
    #   @bot.api.send_message(chat_id: message.from.id, text: "Выберите корпус", reply_markup: inline_markup)
    # end

    private

    def send_stage(message, stage, corpus)
      @bot.api.send_document(chat_id: message.from.id, document: document(stage, corpus))
    end

    def document(num, corpus)
      case corpus
      when 'new'
        if num == 1
          return "https://vstankine.ru/sites/default/files/1_etazh_novy_korpus_12_1.pdf"
        elsif num == 5 || num == 6 || num == 7 || num == 9
          return  "https://vstankine.ru/sites/default/files/novyy_korpus_#{num}_etazh.pdf"
        else
          return "https://vstankine.ru/sites/default/files/novyy_korpus_#{num}_etazh_12.pdf"
        end
      when 'old'
        if num == 1 || num == 2
          return "https://vstankine.ru/sites/default/files/staryy_korpus_#{num}_etazh.pdf"
        # elsif
        # else
        end

      when 'transition'
        return "https://vstankine.ru/sites/default/files/perehod_12_versiya.pdf"
      end
    end

    # def send_buttons_new_stages(message)
    #   ikb = [Bot::InlineButton::Navigation::FIRST_STAGE_OLD, Bot::InlineButton::Navigation::SECOND_STAGE_OLD,
    #          Bot::InlineButton::Navigation::THIRD_STAGE_OLD,  Bot::InlineButton::Navigation::FOURTH_STAGE_OLD,
    #          Bot::InlineButton::Navigation::FIFTH_STAGE_OLD,  Bot::InlineButton::Navigation::SIXTH_STAGE_OLD,
    #          Bot::InlineButton::Navigation::SEVENTH_STAGE_OLD,  Bot::InlineButton::Navigation::EIGHTH_STAGE_OLD,
    #          Bot::InlineButton::BACK]
    #   inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
    #   @bot.logger.info('Send inline navigation stages')
    #   @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    # end

    def send_buttons_old_stages(message)
      ikb = [Bot::InlineButton::Navigation::FIRST_STAGE_NEW, Bot::InlineButton::Navigation::SECOND_STAGE_NEW,
             Bot::InlineButton::Navigation::THIRD_STAGE_NEW,  Bot::InlineButton::Navigation::FOURTH_STAGE_NEW,
             Bot::InlineButton::Navigation::FIFTH_STAGE_NEW,  Bot::InlineButton::Navigation::SIXTH_STAGE_NEW,
             Bot::InlineButton::Navigation::SEVENTH_STAGE_NEW,  Bot::InlineButton::Navigation::EIGHTH_STAGE_NEW,
             Bot::InlineButton::BACK]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation stages')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    def send_buttons_transition_stage(message)
      ikb = [Bot::InlineButton::Navigation::TRANSITION,
             Bot::InlineButton::BACK]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send inline navigation stages')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    # def to_image
    #   uri = URI("https://vstankine.ru/sites/default/files/1_etazh_novy_korpus_12_1.pdf")
    #   response = Net::HTTP.get_response(uri)
    #   image = Magick::ImageList.new(response.body)
    #   image.write('image.jpg')
    # end
  end
end
