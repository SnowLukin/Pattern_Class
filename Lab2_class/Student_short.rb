#
#  +----------------------------------------+
#  |              Student_short             |
#  +----------------------------------------+
#  | - id: string                            |
#  | - surname: string                       |
#  | - git: string                           |
#  | - contact: string                       |
#  +----------------------------------------+
#  | + initialize(id: string, surname: string, git: string, contact: string) |
#  | + to_s(): string                        |
#  | + id(): string                          |
#  | + surname(): string                     |
#  | + git(): string                         |
#  | + contact(): string                     |
#  +----------------------------------------+

require_relative 'Student_super'


# This class represents a student with an ID, surname, git username, and contact information.
# The class is a subclass of the Student_super class.
class Student_short < Student_super
  # A string representing the student's contact information.
  attr_accessor :contact

  
  # Initializes the id, surname, git, and contact attributes with the given values.
  #
  # Parameters:
  # id - The student ID.
  # surname - The student's surname.
  # git - The student's git username.
  # contact - The student's contact information.
  def initialize(id, surname, git, contact)
    super(id, surname, git)
    @contact = contact
  end

  # Returns a string representation of the student in the format "ID: [id], Surname: [surname], Git: [git], Contact: [contact]".
  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
  end
end
