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
# | + read_from_txt(filePath: String) |
# | + write_to_txt(file_path: String, students: [Student]) |
# | + valid_phone?(phone: String)|
# | + valid_email?(email: String)|
# | + valid_git?(git: String)    |
# | + validate_contacts_presence |
# | + validate_git_presence      |
# | + validate                   |
# | + set_contacts(contacts: Hash)|
# ---------------------

# TODO: - Changes needed

# `id`: an integer that represents the ID of the student.
# `surname`, `name`, `middle_name`: strings that represent the surname, name, and middle name of the student, respectively. These fields are required.
# `phone`, `telegram`, `email`, `git`: strings that represent the phone number, telegram account, email, and git account of the student, respectively. These fields are optional.
# initialize: the constructor method that takes a hash of parameters and creates a new Student object. It validates the required fields and raises an error if any of the required fields are missing. It also validates the phone number, email, and git fields using the valid_phone?, valid_email?, and valid_git? methods, respectively.
# to_s: a method that returns a string representation of the student object in a human-readable format.
# valid_phone?, valid_email?, valid_git?: methods that validate the phone number, email, and git fields using regular expressions, respectively.
# validate_contacts_presence, validate_git_presence: methods that check if at least one contact or git field is present, respectively.
# validate: a method that validates that both the contacts and git fields are present.
# set_contacts: a method that sets multiple contacts in one call.
# from_string: a method that takes a string and creates a new Student object from it.
# get_info: a method that returns short student's information.
# get_name_info: a method that returns student's surname, name and middle name in short way: Ivanov I.I..
# get_git_info: a method that returns student's git account.
# get_contact_info: a method that returns one of student's contacts.

require_relative 'Student_super'

class Student < Student_super
    # Create getters and setters for all instance variables
    attr_accessor :name, :middle_name, :phone, :telegram, :email
    
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
        super.initialize(id: params[:id], surname: params[:surname], git: params[:git])
        @name = params[:name]
        @middle_name = params[:middle_name]
        
        set_contacts(params[:phone], params[:telegram], params[:email])
        
        # name, surname and middle_name are required
        raise ArgumentError, "Name, surname and middle_name are required" unless @name && @surname && @middle_name
        
        # Validate that at least one contact is present and git is present
        if !validate
            raise ArgumentError, "Git and at least one contact is req..."
        end
    end
    
    # Override to_s method
    def to_s
        "ID: #{@id}, Surname: #{@surname}, Name: #{@name}, Middle Name: #{@middle_name}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
    end
    
    # From string to Student object
    def self.from_string(string)
        # string = string.gsub(/\s+/, '') # remove whitespaces from string
        id, surname, name, middle_name, phone, telegram, email, git = string.split(',')
        params = {
            id: id,
            surname: surname,
            name: name,
            middle_name: middle_name,
            phone: phone,
            telegram: telegram,
            email: email,
            git: git
        }
        new(params)
    end
    
    # Reads student data from a text file and returns an array of Student objects.
    #
    # @param file_path [String] the path to the text file to be read
    # @return [Array<Student>] an array of Student objects created from the data in the file
    # @raise [RuntimeError] if the file cannot be found or there is an error while reading it
    def self.read_from_txt(file_path)
        students = []
        begin
            File.open(file_path, 'r') do |file|
                file.each_line do |line|
                    id, surname, name, middle_name, phone, telegram, email, git = line.split(',')
                    params_to = { id: id, surname: surname, name: name, middle_name: middle_name, phone: phone, telegram: telegram, email: email, git: git }
                    Student.new(params_to) << students
                end
            end
            students
            rescue => exception
            raise "File not found at the given address #{file_path}. Exception: #{exception.message}"
        end
    end
    
    # Writes student data to a text file.
    #
    # @param file_path [String] the path to the text file to be written
    # @param students [Array<Student>] an array of Student objects whose data will be written to the file
    # @raise [RuntimeError] if there is an error while writing to the file
    def self.write_to_txt(file_path, students)
        begin
            File.open(file_path, 'w') do |file|
                students.each do |student|
                    file.puts "#{student.id},#{student.surname},#{student.name},#{student.middle_name},#{student.phone},#{student.telegram},#{student.email},#{student.git}"
                end
            end
            rescue => exception
            raise "File could not be written at the given address #{file_path}. Exception: #{exception.message}"
        end
    end
    
    # Set contacts
    def set_contacts(phone, telegram, email)
        if phone && !Student.is_valid_phone?(phone)
            raise ArgumentError, "Phone in wrong format."
        end
        
        if email && !Student.is_valid_email?(email)
            raise ArgumentError, "Email in wrong format."
        end
        
        @phone = phone
        @telegram = telegram
        @email = email
    end
    
    # Short info about student
    def get_info
        "#{get_name_info}, Git: #{@git}, #{get_contact_info}"
    end
    
    # Name info: Ivanov I.I.
    def get_name_info
        "#{@surname} #{@name[0]}.#{@middle_name[0]}."
    end
    
    # Contact info (phone, telegram or email)
    def get_contact_info
        return "Phone: #{@phone}" if @phone
        return "Telegram: #{@telegram}" if @telegram
        "Email: #{@email}" if @email
    end
    
    # Validate phone number
    def self.is_valid_phone?(phone)
        phone =~ VALID_PHONE_REGEX
    end
    
    # Validate email
    def self.is_valid_email?(email)
        email =~ VALID_EMAIL_REGEX
    end
    
    # MARK: - PRIVATE
    private
    # Validate that at least one contact is present and git is present
    def validate
        validate_git_presence && validate_contacts_presence
    end
    
    # Validate that at least one contact is present
    def validate_contacts_presence
        return true if phone || telegram || email
        puts "At least one contact (phone, telegram, mail) is required"
        false
    end
end

