# frozen_string_literal: true

require_relative 'file_manager'
require_relative 'FileStrategies/txt_file_strategy'
require_relative 'FileStrategies/json_file_strategy'
require_relative 'FileStrategies/yaml_file_strategy'

class StudentFileManager
	include FileManager

	def load_data(source)
		set_strategy_for(source)
		@strategy.load_data(source)
	end

	def save_data(destination, data)
		set_strategy_for(destination)
		@strategy.save_data(destination, data)
	end

	private
	def set_strategy_for(file_path)
		case File.extname(file_path)
		when '.txt'
			@strategy = TXTFileStrategy.new
		when '.json'
			@strategy = JSONFileStrategy.new
		when '.yaml'
			@strategy = YAMLFileStrategy.new
		else
			raise "Unknown file type"
		end
	end
end
