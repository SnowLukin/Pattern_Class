class Student_super
  attr_reader :id, :surname, :git

  def initialize(id, surname, git)
    @id = id
    @surname = surname
    @git = git
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}"
  end
end
