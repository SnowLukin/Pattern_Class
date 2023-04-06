
require_relative '/FileStrategies/txt_file_strategy'
require_relative '/FileStrategies/json_file_strategy'
require_relative '/FileStrategies/yaml_file_strategy'
require_relative '../data_manager'

module FileManager

	attr_reader :file_path

	def initialize(file_path)
		@file_path = file_path
	end

	def file_path=(value)
		@file_path = value
		set_strategy
	end

	private
	def set_strategy
		case File.extname(@file_path)
		when '.txt'
			@strategy = TXTFileStrategy.new @file_path
		when '.json'
			@strategy = JSONFileStrategy.new @file_path
		when '.yaml'
			@strategy = YAMLFileStrategy.new @file_path
		else
			raise "Unknown file type"
		end
	end
end

