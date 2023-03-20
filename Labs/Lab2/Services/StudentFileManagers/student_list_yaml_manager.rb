# frozen_string_literal: true

require 'yaml'
require_relative '../file_manager'
require_relative '../FileStrategies/file_strategy_yalm'
require_relative 'student_file_manager'

class StudentListYAMLManager < StudentFileManager
	include FileManager

	public_class_method :new

	def initialize(file_path)
		@file_path = file_path
		@strategy = FileStrategyYALM.new
	end
end
