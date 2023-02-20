require_relative 'Student_super'

class Student_short < Student_super
  attr_reader :contact

  def initialize(id, surname, git, contact)
    super.initialize(id, surname, git)
    @contact = contact
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
  end
end
