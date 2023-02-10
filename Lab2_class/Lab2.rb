#Создать класс Student в отдельном файле с полями объекта
# ID, Фамилия, Имя, Отчество, Телефон, Телеграм, Почта,
# Гит. ФИО – обязательно, остальные – нет.
class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Email regex
  # Email address must be in the following format:
  #  - 1 or more characters
  # - @
  # - 1 or more characters
  # - .
  # - 1 or more characters
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Phone number regex
  # Phone number must be in the following format:
  # - one plus sign
  # - 10 digits
  # - no spaces
  # - no letters
  # - no special characters
  # - no dashes
  # - no parentheses
  # - no periods
  VALID_PHONE_REGEX = /\A\+?\d{10}\z/

  # Git regex
  # Git must be in the following format:
  # - https://github.com
  # - 1 or more characters
  # - no spaces
  # - no special characters
  # - no dashes
  VALID_GIT_REGEX = /\Ahttps:\/\/github\.com\/\w+\z/

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
      raise ArgumentError, "Phone in wrong format."
    end

    # Validate email
    if @email && !Student.valid_email?(@email)
      raise ArgumentError, "Email in wrong format."
    end

    # Validate git
    if @git && !Student.valid_git?(@git)
      raise ArgumentError, "Git in wrong format."
    end

    # Validate that at least one contact is present and git is present
    validate
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Name: #{@name}, Middle Name: #{@patronymic}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

  def self.valid_phone?(phone)
    phone =~ VALID_PHONE_REGEX
  end

  def self.valid_email?(email)
    email =~ VALID_EMAIL_REGEX
  end

  def self.valid_git?(git)
    git =~ VALID_GIT_REGEX
  end

  def validate_contacts_presence
    return true if phone || telegram || mail
    puts "At least one contact (phone, telegram, mail) is required"
    false
  end

  def validate_git_presence
    return true if git
    puts "Git field is required"
    false
  end

  def validate
    validate_git_presence && validate_contacts_presence
  end

  def set_contacts(contacts = {})
    @phone = contacts[:phone]
    @telegram = contacts[:telegram]
    @mail = contacts[:mail]
  end

end
