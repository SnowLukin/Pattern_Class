# frozen_string_literal: true

module StrategyTemplate

	def use
		raise "Not implemented"
	end

end

class StrategyOne
	include StrategyTemplate

	def use
		puts "Strategy one"
	end
end

class StrategyTwo

	include StrategyTemplate

	def use
		puts "Strategy two"
	end
end

class StrategyThree
	include StrategyTemplate

	def use
		puts "Strategy three"
	end
end

class Context
	attr_accessor :strategy
	def initialize(strategy)
		@strategy = strategy
	end
	def useStrategy
		strategy.use
	end
end

context = Context.new StrategyOne.new
context.useStrategy

context.strategy = StrategyTwo.new
context.useStrategy

context.strategy = StrategyThree.new
context.useStrategy