module FileManager
	attr_accessor :file_path
	attr_reader :strategy

	def load_data(source = @file_path)
	end

	def save_data(destination = @file_path)
	end
end

