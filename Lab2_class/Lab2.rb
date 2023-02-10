#Создать класс Student в отдельном файле с полями объекта
# ID, Фамилия, Имя, Отчество, Телефон, Телеграм, Почта,
# Гит. ФИО – обязательно, остальные – нет.

class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Init with any number of params
  def initialize(params = {})
    @id = params[:id]
    @surname = params[:surname]
    @name = params[:name]
    @patronymic = params[:patronymic]
    @phone = params[:phone]
    @telegram = params[:telegram]
    @email = params[:email]
    @git = params[:git]
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end

end
