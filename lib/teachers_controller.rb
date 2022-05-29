require 'open-uri'
require 'net/http'
require_relative 'request'
require_relative 'base_bot'
require_relative 'objects/teacher'

module Bot
  class TeachersController < BaseBot
    URL = 'https://rinh-api.kovalev.team'

    def listen(message)
      
    end

    def send_info(message)
      @bot.api.send_message(chat_id: message.from.id, text: "Введите фамилию преподавателя")
    end

    private

    def parse(data)

    end

    def find_by_surname(request)
      uri = URI(URL + "/employee/surname/#{}")
    end
  end
end
