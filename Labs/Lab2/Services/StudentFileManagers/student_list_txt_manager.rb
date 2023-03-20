# frozen_string_literal: true

require_relative '../file_manager'
require_relative '../FileStrategies/file_strategy_txt'
require_relative 'student_file_manager'

class StudentListTxtManager < StudentFileManager
	include FileManager

	public_class_method :new

	def initialize(file_path)
		@file_path = file_path
		@strategy = FileStrategyTXT.new
	end
end