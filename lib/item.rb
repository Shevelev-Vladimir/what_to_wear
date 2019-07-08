# encoding: utf-8

# Класс Вещь.
class Item
  attr_reader :name, :type, :temp_range

  def initialize(name, type, temp_range)
    @name = name
    @type = type
    @temp_range = temp_range
  end

  # Собираем в массив данные из файла.
  def self.from_file(path)
    item = File.readlines(path, encoding: "UTF-8", chomp: true)

    temps = item[2].scan(/\-?\d+/).map(&:to_i)

    name = item[0]
    type = item[1]
    temp_range = temps[0]..temps[1]

    # Передаём в конструктор собранные данные.
    self.new(name, type, temp_range)
  end

  def to_s
    "#{name} (#{type}) #{temp_range}"
  end

  # Проверяем подходит ли вещь под текущую температуру.
  def under?(temperture)
    temp_range.include?(temperture)
  end
end
