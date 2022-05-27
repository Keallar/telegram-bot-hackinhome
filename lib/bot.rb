require 'telegram/bot'
require 'dotenv/load'

module Bot
  class BaseBot
    attr_accessor :bot

    def initialize(bot)
      @bot = bot
      @commands = {}
    end


  end
end

