#    _______________________________________________________
#    |                 Student_super                         |
#    |-------------------------------------------------------|
#    | #id: String                                           |
#    | #surname: String                                      |
#    | #git: String                                          |
#    |-------------------------------------------------------|
#    | + initialize(id: String, surname: String, git: String)|
#    | + to_s(): String                                      |
#    |-------------------------------------------------------|
#    | - validate_git()                                      |
#    | - validate_git_presence()                             |
#    | + self.is_valid_git?(git: String): Boolean            |
#    |_______________________________________________________|


# This class represents a student with an ID, surname, and git username.
class Student_super
    # A string representing the student ID.
    attr_accessor :id
    # A string representing the student's surname.
    attr_accessor :surname
    # A string representing the student's git username.
    attr_accessor :git
    
    def initialize(id, surname, git)
        @id = id
        @surname = surname
        @git = git
    end
    
    # In case the private init is needed
    # private_class_method :new
    
    
    # Returns a string representation of the student in the format "ID: [id], Surname: [surname], Git: [git]".
    def to_s
        "ID: #{@id}, Surname: #{@surname}, Git: #{@git}"
    end
    
    # Validate git
    def self.is_valid_git?(git)
        git =~ VALID_GIT_REGEX
    end
    
    private
    
    # Validate git
    def validate_git
        if @git && !Student.is_valid_git?(@git)
            raise ArgumentError, "Git in wrong format."
        end
    end
    
    # Validate that git is present
    def validate_git_presence
        return true if git
        puts "Git field is required"
        false
    end
end
