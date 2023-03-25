# frozen_string_literal: true

require_relative 'file_manager'
require_relative 'FileStrategies/txt_file_strategy'
require_relative 'FileStrategies/json_file_strategy'
require_relative 'FileStrategies/yaml_file_strategy'

class StudentFileManager
	include FileManager

	def initialize(strategy = TXTFileStrategy.new)
		@strategy = strategy
	end

	def load_data(source)
		@strategy.load_data(source)
	end

	def save_data(destination, data)
		@strategy.save_data(destination, data)
	end

	def configure_json
		@strategy = JSONFileStrategy.new
	end

	def configure_txt
		@strategy = TXTFileStrategy.new
	end

	def configure_yaml
		@strategy = YAMLFileStrategy.new
	end
end
