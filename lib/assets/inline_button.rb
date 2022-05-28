require 'telegram/bot'

module Bot
  module InlineButton

    module ListOfLesson
      TEORVER ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Теор. вер', callback_data: 'lesson_teorver')
    end

    module Schedule
      WEEK ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'На неделю', callback_data: 'schedule_week')
    end

    module Corpus
      NEW_CORPUS ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Новый корпус', callback_data: 'corpus_new')
      OLD_CORPUS ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Старый корпус', callback_data: 'corpus_old')
      TRANSITION ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Переход', callback_data: 'corpus_transition')
    end

    module Navigation
      FIRST_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '1 этаж', callback_data: 'navigation_1_stage_new')
      SECOND_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '2 этаж', callback_data: 'navigation_2_stage_new')
      THIRD_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '3 этаж', callback_data: 'navigation_3_stage_new')
      FOURTH_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '4 этаж', callback_data: 'navigation_4_stage_new')
      FIFTH_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '5 этаж', callback_data: 'navigation_5_stage_new')
      SIXTH_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '6 этаж', callback_data: 'navigation_6_stage_new')
      SEVENTH_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '7 этаж', callback_data: 'navigation_7_stage_new')
      EIGHTH_STAGE_NEW ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '8 этаж', callback_data: 'navigation_8_stage_new')
      FIRST_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '1 этаж', callback_data: 'navigation_1_stage_old')
      SECOND_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '2 этаж', callback_data: 'navigation_2_stage_old')
      THIRD_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '3 этаж', callback_data: 'navigation_3_stage_old')
      FOURTH_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '4 этаж', callback_data: 'navigation_4_stage_old')
      FIFTH_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '5 этаж', callback_data: 'navigation_5_stage_old')
      SIXTH_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '6 этаж', callback_data: 'navigation_6_stage_old')
      SEVENTH_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '7 этаж', callback_data: 'navigation_7_stage_old')
      EIGHTH_STAGE_OLD ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: '8 этаж', callback_data: 'navigation_8_stage_old')
      TRANSITION ||= Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Переход', callback_data: 'navigation_transition')
    end
  end
end
