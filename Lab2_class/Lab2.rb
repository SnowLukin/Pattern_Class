#Создать класс Student в отдельном файле с полями объекта
# ID, Фамилия, Имя, Отчество, Телефон, Телеграм, Почта,
# Гит. ФИО – обязательно, остальные – нет. Написать
# конструктор, написать геттер и сеттер для каждого поля,
# при именовании методов ОБЯЗАТЕЛЬНО пользоваться
# соглашениями о наименованиях в ruby.

class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(id, surname, name, patronymic, phone, telegram, email, git)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end

end

# Создать несколько объектов.
student1 = Student.new(
  1,
  'Иванов', 'Иван', 'Иванович',
  '+380000000000',
  '@ivanov',
  'ivanov@gmail.com',
  'ivanovivan'
)

student2 = Student.new(
  2,
  'Петров', 'Петр', 'Петрович',
  '+380000000001',
  '@petrov',
  'petrov@gmail.com',
  'petrovpetr'
)

# вывести информацию о них на экран
puts student1
puts student2
