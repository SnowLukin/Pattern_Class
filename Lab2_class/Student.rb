#    +---------------------------------+
#    |            Student              |
#    +---------------------------------+
#    | -id: int                        |
#    | -surname: string                |
#    | -name: string                   |
#    | -middle_name: string            |
#    | -phone: string                  |
#    | -telegram: string               |
#    | -email: string                  |
#    | -git: string                    |
#    | +VALID_EMAIL_REGEX: regex       |
#    | +VALID_PHONE_REGEX: regex       |
#    | +VALID_GIT_REGEX: regex         |
#    +---------------------------------+
#    | +new(params)                    |
#    | +from_string(string): Student   |
#    | +read_from_txt(file_path): Array|
#    | +write_to_txt(file_path, students)|
#    | +set_contacts(phone, telegram, email)|
#    | +get_info: string               |
#    | +get_name_info: string          |
#    | +get_contact_info: string       |
#    +---------------------------------+


#    The Student class has the following attributes:
#
#    * id: an integer that represents the unique identifier of the student
#    * surname: a string that represents the surname of the student
#    * name: a string that represents the name of the student
#    * middle_name: a string that represents the middle name of the student
#    * phone: a string that represents the phone number of the student
#    * telegram: a string that represents the Telegram account of the student
#    * email: a string that represents the email address of the student
#    * git: a string that represents the Git account of the student

#    The Student class has the following methods:
#
#    * new(params): a constructor that initializes a new Student object with the given parameters.
#    * from_string(string): a static method that creates a new Student object from a string.
#    * read_from_txt(file_path): a static method that reads student data from a text file and returns an array of Student objects.
#    * write_to_txt(file_path, students): a static method that writes student data to a text file.
#    * set_contacts(phone, telegram, email): a method that sets the phone, telegram, and email attributes of the Student object.
#    * get_info(): a method that returns a short string containing the name, Git account, and contact information of the Student object.
#    * get_name_info(): a method that returns a short string containing the surname, name initial, and middle name initial of the Student object.
#    * get_contact_info(): a method that returns a short string containing the phone, telegram, or email of the Student object.

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

