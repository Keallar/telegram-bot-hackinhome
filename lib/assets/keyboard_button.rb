require 'telegram/bot'

module Bot
  module KeyboardButton
    # MAIN_MENU ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Главное меню')
    AUTHORIZATION ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Авторизация')
    TEACHERS ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Поиск преподавателя')
    # BACK ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')
    ELDER_PERMISSIONS ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Функционал старосты')
    GET_SCHEDULE ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Расписание')
    GET_SUBJECTS ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Изучаемые предметы')
    GET_NAVIGATION ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Навигация по ВУЗу')
    PROPOSAL ||= Telegram::Bot::Types::KeyboardButton.new(text: "Заявка")
    DEBT ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Долги')

    module Elder
      GROUP_LIST ||= Telegram::Bot::Types::KeyboardButton.new(text: 'Список группы')
    end
  end
end
