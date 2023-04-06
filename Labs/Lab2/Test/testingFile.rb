require_relative '../StudentInfo/p/StudentInfo/student'
require_relative '../StudentInfo/student_display'
require_relative '../StudentInfo/student_display_list'

def create_student(id)
	Student.new(
		id: id,
		surname: 'Harvey',
		name: 'Steve',
		middle_name: 'Biden',
		contact_info: { phone: '+1234567890', email: 'Steve@email.ru' },
		git: 'https://github.com/Steve'
	)
end

def create_students(number)
	students = []
	(1..number).each do |id|
		students.append create_student(id)
	end
	students
end

def print_students(students)
	students.each do |student|
		puts student
	end
end

def test_student_list(student)
	data_list = StudentDisplayList.new([student])
	data_list.set_data([student])
	puts data_list.select(0)
	puts data_list.get_names.to_s
	puts data_list.get_data.data.to_s
	data_list
end

def test_txt_file_manager(student_list)
	student_list.load_data '/Users/snowlukin/Desktop/University/Pattern_Class/Labs/StudentApp/Test/TXT/input_txt.txt'
	puts student_list.get_data.to_s
	student_list.save_data '/Users/snowlukin/Desktop/University/Pattern_Class/Labs/StudentApp/Test/TXT/output_txt.txt'
end

def test_json_file_manager(student_list)
	student_list.load_data '/Users/snowlukin/Desktop/University/Pattern_Class/Labs/StudentApp/Test/JSON/input_json.json'
	puts student_list.get_data.to_s
	student_list.save_data '/Users/snowlukin/Desktop/University/Pattern_Class/Labs/StudentApp/Test/JSON/output_json.json'
end

def test_yaml_file_manager(student_list)
	student_list.load_data '/Users/snowlukin/Desktop/University/Pattern_Class/Labs/StudentApp/Test/YAML/input_yaml.yaml'
	puts student_list.get_data.to_s
	student_list.save_data '/Users/snowlukin/Desktop/University/Pattern_Class/Labs/StudentApp/Test/YAML/output_yaml.yaml'
end

def main_test
	print_students(create_students(3))
	student = create_student(0)
	student_display = StudentDisplay.new student
	student_list = test_student_list student_display
	test_txt_file_manager student_list
	test_json_file_manager student_list
	test_yaml_file_manager student_list
end

main_test
