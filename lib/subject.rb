require 'telegram/bot'
require 'json'
require_relative 'base_bot'
require_relative 'request'

module Bot
  class Subject < BaseBot
    def subjects_list(message)
      response = Request.send_data(@bot,'subjects')
      @bot.api.send_message(chat_id: message.from.id, text: "#{response.to_json}")
    end

    private

    def parse_subjects(json)

      arr = []
      json.first.to_h.each_value do |value|
        temp = value unless value.nil? || value.is_a?(Hash)

      end
    end
  end
end
