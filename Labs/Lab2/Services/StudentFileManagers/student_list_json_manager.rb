# frozen_string_literal: true

require 'json'
require_relative '../file_manager'
require_relative '../FileStrategies/file_strategy_json'
require_relative 'student_file_manager'

class StudentListJSONManager < StudentFileManager
	include FileManager

	public_class_method :new

	def initialize(file_path)
		@file_path = file_path
		@strategy = FileStrategyJSON.new
	end
end
