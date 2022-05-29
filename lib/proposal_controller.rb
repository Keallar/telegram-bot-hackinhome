require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'base_bot'
require_relative 'request'
require_relative 'inline_button_generator'
require_relative 'objects/proposal'

module Bot
  class ProposalController < BaseBot
    attr_accessor :arr_proposals

    ENUM = {
      :profcom => "Заявление в профком",
      :army => "Справка в военкомат",
      :studiiying => "Справка обучающегося"
    }

    def listen(message)
      if message.data.split('_').first == 'proposal'
        @arr_proposals.each do |proposal|
          if message.data == proposal.callback_data
            request(proposal)
            @bot.api.send_message(chat_id: message.from.id, text: "Отправлена заявка #{proposal.type}")
          end
        end
      end
    end

    def send_info(message)
      @arr_proposals = []
      id = 0
      ENUM.each_value do |e|
        button = []
        id += 1
        button << Bot::InlineButtonGenerator.create('proposal', { 'name' => e, 'id' => id })
        button << Bot::InlineButtonGenerator.callback_data('proposal', { 'name' => e, 'id' => id })
        @arr_proposals << Proposal.new(e, button)
      end
      ikb = []
      @arr_proposals.each do |proposal|
        @bot.logger.info "proposal #{proposal.type}"
        ikb << proposal.inline_button
      end
      inline_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: ikb)
      @bot.logger.info('Send from proposal controller')
      @bot.api.send_message(chat_id: message.from.id, text: "Выберите заявку", reply_markup: inline_markup)
    end

    private

    def request(data)
      Request.send_data(@bot, 'proposal', { 'type' => data.type, 'additional_info' => data.additional_info })
    end
  end
end
