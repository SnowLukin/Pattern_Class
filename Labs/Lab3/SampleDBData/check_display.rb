# frozen_string_literal: true

require 'pg'
require_relative '../api_manager'
require_relative '../student_repository'
require 'singleton'

api_manager = APIManager.instance

student_repository = StudentRepository.new api_manager

puts student_repository.get_display_list(2, 2)