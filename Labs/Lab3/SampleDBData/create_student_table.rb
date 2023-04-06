# frozen_string_literal: true

require 'pg'
require_relative '../../StudentApp/Services/APIManager/api_manager'
require_relative '../../StudentApp/Services/APIManager/student_repository'

api_manager = APIManager.instance

# Creating Students table if it doesnt exist yet
StudentRepository.new api_manager
