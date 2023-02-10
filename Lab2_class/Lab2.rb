# Class Student have the following fields:
# ID, Surname, Name, Middle Name, Phone, Telegram, Email, Git.
# Surname, Name, Middle Name are required, the rest are not.
class Student
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
