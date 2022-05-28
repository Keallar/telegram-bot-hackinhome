require 'telegram/bot'
require 'uri'
require 'net/http'
require_relative 'base_bot'

module Bot
  class Navigation < BaseBot

    def listen(message, data)
      case data
      when 'navigation_1_stage'
        send_stage(message, 1)
      when 'navigation_2_stage'
        send_stage(message, 2)
      when 'navigation_3_stage'
        send_stage(message, 3)
      when 'navigation_4_stage'
        send_stage(message, 4)
      when 'navigation_5_stage'
        send_stage(message, 5)
      when 'navigation_6_stage'
        send_stage(message, 6)
      when 'navigation_7_stage'
        send_stage(message, 7)
      when 'navigation_8_stage'
        send_stage(message, 8)
      end
    end

    def send_buttons(message)
      ikb = [Bot::InlineButton::Navigation::FIRST_STAGE, Bot::InlineButton::Navigation::SECOND_STAGE,
             Bot::InlineButton::Navigation::THIRD_STAGE,  Bot::InlineButton::Navigation::FOURTH_STAGE,
             Bot::InlineButton::Navigation::FIFTH_STAGE,  Bot::InlineButton::Navigation::SIXTH_STAGE,
             Bot::InlineButton::Navigation::SEVENTH_STAGE,  Bot::InlineButton::Navigation::EIGHTH_STAGE]
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      bot.logger.info('Send inline navigation')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите этаж", reply_markup: inline_markup)
    end

    private

    def send_stage(message, stage)
      @bot.api.send_document(chat_id: message.from.id, document: uri(stage))
    end

    def uri(num)
      Faraday.new(url: "https://vstankine.ru/sites/default/files/novyy_korpus_#{num}_etazh_12.pdf") do |faraday|

      end
    end
  end
end
