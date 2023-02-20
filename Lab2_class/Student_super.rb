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
  # Attribute: id
  #
  # A string representing the student ID.
  attr_reader :id

  # Attribute: surname
  #
  # A string representing the student's surname.
  attr_reader :surname

  # Attribute: git
  #
  # A string representing the student's git username.
  attr_reader :git

  # Method: initialize
  #
  # Initializes the id, surname, and git attributes with the given values.
  #
  # Parameters:
  # id - The student ID.
  # surname - The student's surname.
  # git - The student's git username.
  def initialize(id, surname, git)
    @id = id
    @surname = surname
    @git = git
  end

  # Method: to_s
  #
  # Returns a string representation of the student in the format "ID: [id], Surname: [surname], Git: [git]".
  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}"
  end
end
