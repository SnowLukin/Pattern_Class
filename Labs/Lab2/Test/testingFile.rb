require_relative '../StudentInfo/student'
require_relative '../StudentInfo/student_list'
require_relative '../Services/student_list_txt_manager'
require_relative '../Services/student_list_json_manager'
require_relative '../Services/student_list_yaml_manager'

def create_students(number)
	students = []
	(1..number).each do |id|
		students.append Student.new(
			id: id,
			surname: 'Harvey',
			name: 'Steve',
			middle_name: 'Biden',
			contact_info: { phone: '+1234567890', email: 'Steve@email.ru' },
			git: 'https://github.com/Steve'
		)
	end
	students
end

def print_students(students)
	students.each do |student|
		puts student
	end
end

def test_student_list
	student = Student.new(
		id: 0,
		surname: 'Harvey',
		name: 'Steve',
		middle_name: 'Biden',
		contact_info: { phone: '+1234567890', email: 'Steve@email.ru' },
		git: 'https://github.com/Steve'
	)
	data_list = StudentList.new([student])
	data_list.set_data([student])
	puts data_list.select(0)
	puts data_list.get_names.to_s
	puts data_list.get_data.data.to_s
end

def test_txt_file_manager
	student_txt = StudentListTxtManager.new("/Users/snowlukin/Desktop/University/Pattern_Class/Labs/Lab2/Test/TXT/input_txt.txt")
	student_txt.load_data
	puts student_txt.get_data.to_s
	student_txt.save_data("/Users/snowlukin/Desktop/University/Pattern_Class/Labs/Lab2/Test/TXT/output_txt.txt")
end

def test_json_file_manager
	student_json = StudentListJSONManager.new("/Users/snowlukin/Desktop/University/Pattern_Class/Labs/Lab2/Test/JSON/input_json.json")
	student_json.load_data
	puts student_json.get_data.to_s
	student_json.save_data("/Users/snowlukin/Desktop/University/Pattern_Class/Labs/Lab2/Test/JSON/output_json.json")
end

def test_yalm_file_manager
	student_yalm = StudentListYAMLManager.new "/Users/snowlukin/Desktop/University/Pattern_Class/Labs/Lab2/Test/YALM/input_yalm.yalm"
	student_yalm.load_data
	puts student_yalm.get_data.to_s
	student_yalm.save_data("/Users/snowlukin/Desktop/University/Pattern_Class/Labs/Lab2/Test/YALM/output_yalm.yalm")
end

def main_test
	print_students(create_students(3))
	test_student_list
    test_txt_file_manager
	test_json_file_manager
end

test_yalm_file_manager
# main_test
