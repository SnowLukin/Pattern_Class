#+----------------------------------------+
#|              Student_super              |
#+----------------------------------------+
#| - id: string                            |
#| - surname: string                       |
#| - git: string                           |
#+----------------------------------------+
#| + initialize(id: string, surname: string, git: string) |
#| + to_s(): string                        |
#| + id(): string                          |
#| + surname(): string                     |
#| + git(): string                         |
#+----------------------------------------+

# Class: Student_super
#
# This class represents a student with an ID, surname, and git username.
class Student_super
    # A string representing the student ID.
    attr_reader :id
    # A string representing the student's surname.
    attr_reader :surname
    # A string representing the student's git username.
    attr_reader :git
    
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
    # Validate that git is present
    def validate_git_presence
        return true if git
        puts "Git field is required"
        false
    end
end
