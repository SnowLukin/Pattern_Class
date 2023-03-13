require_relative 'Data_list'

class Data_list_Student_short < Data_list

  def select(number)
    @selected << @data[number].id
  end

  def get_names
    %w[id surname initials git contact]
  end

  def get_data
    @data.each { |student| p "#{student.id} #{student.name} #{student.contact} #{student.git}" }
  end
end
