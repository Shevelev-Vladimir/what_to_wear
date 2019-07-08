# Программа "Что надеть?". Версия 1.0.
NUMBER = 1.0
puts "Программа \"Что надеть?\". Версия #{NUMBER}.\n\n"

# Подключаем класс
require_relative 'lib/wardrobe'
require_relative 'lib/item'

# Определяем путь до папки дата.
path_data = "/#{__dir__}/data"

# Считываем данные из файлов и записываем их в объект гардероб.
wardrobe = Wardrobe.from_dir(path_data)

puts 'Сколько градусов за окном? (можно с минусом)'
# Записываем в переменную введённые пользователем данные.
temperture = STDIN.gets.to_i

# Выбираем вещи, подходящие под температуру.
wardrobe.selection_under!(temperture)

# Выбираем из массива с подходящими вещами уникальные типы вещей.
wardrobe.choise_uniq_tipes!

# Вывод варианта гардероба.
puts "\nПредлагаем сегодня надеть:\n\n"
puts wardrobe
