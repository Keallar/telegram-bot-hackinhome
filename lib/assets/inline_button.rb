require 'telegram/bot'

module Bot
  module InlineButton
    GET_ANOTHER_TASK ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Задание', callback_data: 'get_another_task')

    module ListOfLesson

    end

    module Navigation
      FIRST_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '1 этаж', callback_data: '1_stage_navigation')
      SECOND_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '2 этаж', callback_data: '2_stage_navigation')
      THIRD_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '3 этаж', callback_data: '3_stage_navigation')
      FOURTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '4 этаж', callback_data: '4_stage_navigation')
      FIFTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '5 этаж', callback_data: '5_stage_navigation')
      SIXTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '6 этаж', callback_data: '6_stage_navigation')
      SEVENTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '7 этаж', callback_data: '7_stage_navigation')
      EIGHTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '8 этаж', callback_data: '8_stage_navigation')
    end
  end
end
