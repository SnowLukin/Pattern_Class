# frozen_string_literal: true

require_relative 'file_strategy'

class FileStrategyYALM
	include FileStrategy

	def load(file_path)
		YAML.load_file(file_path)
	rescue => e
		raise "Exception: #{e.message}"
	end

	def save(file_path, data)
		File.open(file_path, 'w') { |file| file.write(data.to_yaml) }
	rescue => e
		raise "Exception: #{e.message}"
	end
end
