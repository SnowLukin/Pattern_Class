require_relative 'Student_super'

class Student_short < Student_super
    
    public_class_method :new
    
    protected
    attr_writer :contact
    
    public
    attr_reader :contact
    
    def initialize(params={id: '', surname: '', git: '', contact: ''})
        @id = params[:id]
        @surname = params[:surname]
        @git = params[:git]
        @contact = contact
        
        validate_git
    end
    
    def to_s
        "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
    end
end
