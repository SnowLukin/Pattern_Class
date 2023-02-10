#Создать класс Student в отдельном файле с полями объекта
# ID, Фамилия, Имя, Отчество, Телефон, Телеграм, Почта,
# Гит. ФИО – обязательно, остальные – нет.

class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Phone number 10 - 11 digits
  VALID_PHONE_REGEX = /\A\d{10,11}\z/

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

    # Validate phone number
    if @phone && !Student.valid_phone?(@phone)
      raise ArgumentError, "Неверный формат телефона"
    end
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end

  def self.valid_phone?(phone)
    phone =~ VALID_PHONE_REGEX
  end

end
