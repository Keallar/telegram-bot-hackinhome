require 'open-uri'
require 'cgi'
require 'net/http'
require 'json'
require_relative 'request'
require_relative 'base_bot'
require_relative 'objects/teacher'

module Bot
  class TeachersController < BaseBot
    URL = 'https://rinh-api.kovalev.team'

    def listen(message)
      data = CGI.escape message.text
      json = find_by_surname(data)
      if !json.empty?
        count = 0
        json.each do |value|
          return if count == 5

          count += 1
          @bot.api.send_message(chat_id: message.from.id, text: "#{value['fullName']}")
        end
      else
        @bot.api.send_message(chat_id: message.from.id, text: "Ничего не найдено. Введите ещё раз")
      end
    end

    def send_info(message)
      @bot.api.send_message(chat_id: message.from.id, text: "Введите фамилию преподавателя")
    end

    private

    def find_by_surname(data)
      uri = URI(URL + "/employee/surname/#{data}")
      response = Net::HTTP.get(uri)
      @bot.logger.info(response)
      JSON.parse(response)
    end
  end
end
