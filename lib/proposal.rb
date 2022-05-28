require 'telegram/bot'
require 'json'
require_relative 'base_bot'
require_relative 'request'

module Bot
  class Proposal < BaseBot
    def faqs_all(message)
      response = Request.send_data(@bot, 'faqs')
      @bot.api.send_message(chat_id: message.from.id, text: "#{response.to_json}")
    end

    private

    def parse_faqs(json)

    end
  end
end
