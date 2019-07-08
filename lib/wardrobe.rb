# encoding: utf-8

# Класс Гардероб.
class Wardrobe
  # Выбираем из массива с подходящими вещами уникальные типы вещей.
  def choise_uniq_tipes!
    @items.uniq!(&:type )
  end

  def initialize(items)
    @items = items
  end

  # Выбираем в массиве items подходящие по температуре вещи.
  def selection_under!(temperture)
    @items.select! { |item| item if item.under?(temperture) }
  end

  # Считываем данные из файлов.
  def self.from_dir(path)
    files = Dir["#{path}/*.txt"]
    # В цикле помещаем в массив, объекты класса Вещь.
    items = files.map { |file_name| Item.from_file(file_name) }

    # Вызываем конструктор класса.
    self.new(items)
  end

  def to_s
    @items.join("\n")
  end
end
