# frozen_string_literal: true

require 'glimmer-dsl-libui'
require_relative 'student_display_list_controller'

class StudentDisplayListView
	include Glimmer

	def initialize(file_path)
		@controller = StudentDisplayListController.new(file_path)

		@git_options = ['Yes', 'No', 'Doesnt matter']
		@contact_options = ['Yes', 'No', 'Doesnt matter']
		@mail_options = ['Yes', 'No', 'Doesnt matter']
		@telegram_options = ['Yes', 'No', 'Doesnt matter']

		build_ui
	end

	def build_ui
		window('Students App', 800, 600) {
			margined true
			tab {
				tab_item('Students') {
					vertical_box {
						horizontal_box {
							stretchy false
							label {
								text 'Git:'
							}
							combobox {
								items @git_options
								selected @git_options.index('Doesnt matter')
							}
						}
						horizontal_box {
							label {
								text 'Mail:'
							}
							combobox {
								items @mail_options
								selected @mail_options.index('Doesnt matter')
							}
							stretchy false
						}
						horizontal_box {
							stretchy false
							label {
								text 'Contact:'
							}
							combobox {
								items @contact_options
								selected @contact_options.index('Doesnt matter')
							}
						}
						horizontal_box {
							stretchy false
							label {
								text 'Telegram:'
							}
							combobox {
								items @telegram_options
								selected @telegram_options.index('Doesnt matter')
							}
						}
						refined_table(
							model_array: @controller.student_display_list.get_data.data,
							table_columns: {
								'Id' => :text,
								'Name' => :text,
								'Git' => :text,
								'Contact' => :text,
							},
							table_editable: true,
							per_page: 20,
							visible_page_count: true, # page count can be hidden if preferred

						)

						button('Add Student') {
							stretchy false
						}

						@read_button = button('Read Student') {
							stretchy false
						}

						@update_button = button('Update Student') {
							stretchy false
						}

						@delete_button = button('Delete Student') {
							stretchy false
						}

						@read_button.disable
						@update_button.disable
						@delete_button.disable
					}
				}

				tab_item('Page 2') {}
				tab_item('Page 3') {}
			}
		}.show
	end
end

file_path = '/Users/snowlukin/Desktop/University/Pattern_Class/StudentApp/UnitTests/TestFiles/Mock.json'
StudentDisplayListView.new nil
