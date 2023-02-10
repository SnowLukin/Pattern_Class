
class Student
  # ---------------------
  # |    Student        |
  # ---------------------
  # | - id: Integer     |
  # | - surname: String |
  # | - name: String    |
  # | - middle_name: String |
  # | - phone: String   |
  # | - telegram: String|
  # | - email: String   |
  # | - git: String     |
  # ---------------------
  # | + initialize(params: Hash)   |
  # | + to_s: String                |
  # | + valid_phone?(phone: String)|
  # | + valid_email?(email: String)|
  # | + valid_git?(git: String)    |
  # | + validate_contacts_presence |
  # | + validate_git_presence      |
  # | + validate                   |
  # | + set_contacts(contacts: Hash)|
  # ---------------------
  # `id`: an integer that represents the ID of the student.
  #
  # `surname`, `name`, `middle_name`: strings that represent the surname, name, and middle name of the student, respectively. These fields are required.
  # `phone`, `telegram`, `email`, `git`: strings that represent the phone number, telegram account, email, and git account of the student, respectively. These fields are optional.
  # initialize: the constructor method that takes a hash of parameters and creates a new Student object. It validates the required fields and raises an error if any of the required fields are missing. It also validates the phone number, email, and git fields using the valid_phone?, valid_email?, and valid_git? methods, respectively.
  # to_s: a method that returns a string representation of the student object in a human-readable format.
  # valid_phone?, valid_email?, valid_git?: methods that validate the phone number, email, and git fields using regular expressions, respectively.
  # validate_contacts_presence, validate_git_presence: methods that check if at least one contact or git field is present, respectively.
  # validate: a method that validates that both the contacts and git fields are present.
  # set_contacts: a method that sets multiple contacts in one call.
  # from_string: a method that takes a string and creates a new Student object from it.
  #

  # Create getters and setters for all instance variables
  attr_accessor :id, :surname, :name, :middle_name, :phone, :telegram, :email, :git

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
    @middle_name = params[:middle_name]
    @phone = params[:phone]
    @telegram = params[:telegram]
    @email = params[:email]
    @git = params[:git]

    # name, surname and middle_name required
    raise ArgumentError, "Name, surname and middle_name are required" unless @name && @surname && @middle_name

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

  # Override to_s method
  def to_s
    "ID: #{@id}, Surname: #{@surname}, Name: #{@name}, Middle Name: #{@middle_name}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

  # From string to Student object
  def self.from_string(string)

    # Error if the string doesnt have at least 3 elements
    raise ArgumentError, "Wrong number of arguments" unless string.split(',').length >= 3

    # string = string.gsub(/\s+/, '') # remove whitespaces from string
    id, surname, name, middle_name, phone, telegram, email, git = string.split(',')
    params = { id: id, surname: surname, name: name, middle_name: middle_name, phone: phone, telegram: telegram, email: email, git: git }
    new(params)
  end

  # Validate phone number
  def self.valid_phone?(phone)
    phone =~ VALID_PHONE_REGEX
  end

  # Validate email
  def self.valid_email?(email)
    email =~ VALID_EMAIL_REGEX
  end

  # Validate git
  def self.valid_git?(git)
    git =~ VALID_GIT_REGEX
  end

  # Validate that at least one contact is present
  def validate_contacts_presence
    return true if phone || telegram || email
    puts "At least one contact (phone, telegram, mail) is required"
    false
  end

  # Validate that git is present
  def validate_git_presence
    return true if git
    puts "Git field is required"
    false
  end

  # Validate that at least one contact is present and git is present
  def validate
    validate_git_presence && validate_contacts_presence
  end

  # Set contacts
  def set_contacts(contacts = {})
    @phone = contacts[:phone]
    @telegram = contacts[:telegram]
    @email = contacts[:email]
  end
end

