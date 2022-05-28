require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'base_bot'
require_relative 'request'

module Bot
  class ProposalController < BaseBot
    def listen(message)

    end

    def send_info(message)
      @bot.api.send_message(chat_id: message.from.id, text: "Введите ваш вопрос (в конце обязательно поставьте знак вопроса)", reply_markup: markup)
    end

    private

    def request

    end
  end
end
