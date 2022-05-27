require 'telegram/bot'

module Bot
  module KeyboardButton
    MAIN_MENU ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Главное меню')
    AUTHORIZATION ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Авторизация')
    TEACHERS ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Преподаватели')
    BACK ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')
    ELDER_PERMISSIONS ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Функционал старосты')
    GET_SCHEDULE ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Расписание')
    GET_LINKS_ON_LESSONS ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Ссылки на предмет')
    GET_NAVIGATION ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Навигация по ВУЗу')

    module Elder
      GROUP_LIST ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Список группы')
    end
  end
end
