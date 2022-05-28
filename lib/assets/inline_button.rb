require 'telegram/bot'

module Bot
  module InlineButton

    module ListOfLesson
      TEORVER ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Теор. вер', callback_data: 'lesson_teorver')
    end

    module Schedule
      WEEK ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'На неделю', callback_data: 'schedule_week')
    end

    module Navigation
      FIRST_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '1 этаж', callback_data: 'navigation_1_stage')
      SECOND_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '2 этаж', callback_data: 'navigation_2_stage')
      THIRD_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '3 этаж', callback_data: 'navigation_3_stage')
      FOURTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '4 этаж', callback_data: 'navigation_4_stage')
      FIFTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '5 этаж', callback_data: 'navigation_5_stage')
      SIXTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '6 этаж', callback_data: 'navigation_6_stage')
      SEVENTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '7 этаж', callback_data: 'navigation_7_stage')
      EIGHTH_STAGE ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '8 этаж', callback_data: 'navigation_8_stage')
    end
  end
end
