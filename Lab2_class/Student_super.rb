class Student_super
    
    private_class_method :new
    
    protected
    attr_writer :id
    attr_writer :surname
    attr_writer :git
    
    public
    attr_reader :id
    attr_reader :surname
    attr_reader :git
    
    # Git regex
    # Git must be in the following format:
    # - https://github.com
    VALID_GIT_REGEX = /\Ahttps:\/\/github\.com\/\w+\z/
    
    # MARK: Setters
    def update_git(new_git)
        @git = new_git
        validate_git
    end
    
    # Returns a string representation of the student in the format "ID: [id], Surname: [surname], Git: [git]".
    def to_s
        "ID: #{@id}, Surname: #{@surname}, Git: #{@git}"
    end
    
    # Validate git
    def self.is_valid_git?(git)
        git =~ VALID_GIT_REGEX
    end
    
    protected
    # Validate git
    def validate_git
        if @git && !self.is_valid_git?(@git)
            raise ArgumentError, "Git in wrong format."
        end
    end
    
    # Validate that git is present
    def validate_git_presence?
        return true if git
        puts "Git field is required"
        false
    end
end
