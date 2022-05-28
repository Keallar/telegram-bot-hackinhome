require 'net/http'
require 'open-uri'
require 'json'

module Bot
  class Request
    class << self
      URL = 'http://25.6.173.125:8080'

      def send_data(bot, data)
        case data
        when 'subjects'
          request_subject(bot)
        when 'faqs'
          request_faq(bot)
        end
      end

      private

      def request_subject(bot)
        uri = URI(URL + '/subjects/list')
        response = Net::HTTP.get(uri)
        bot.logger.info(response.to_json)
        response.to_json
      end

      def request_faq(bot)
        uri = URI(URL + '/faq/all')
        response = Net::HTTP.get(uri)
        bot.logger.info(response.to_json)
        response.to_json
      end
    end
  end
end
