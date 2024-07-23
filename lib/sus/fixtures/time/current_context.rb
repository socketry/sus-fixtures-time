# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'time'
require 'date'

module Sus
	module Fixtures
		module Time
			# Mocks the current time.
			CurrentContext = Sus::Shared("mocked time context") do |time|
				attr_accessor :current_time
				
				def time_travel(time)
					current_time = @current_time
					@current_time = time
					yield
				ensure
					@current_time = current_time
				end
				
				before do
					@current_time = time
					
					mock(::Time) do |mock|
						mock.wrap(:now) do |original|
							if @current_time
								@current_time.dup
							else
								original.call
							end
						end
						
						mock.wrap(:new) do |original, *arguments|
							if arguments.empty? && @current_time
								@current_time.dup
							else
								original.call(*arguments)
							end
						end
					end
					
					mock(::Date) do |mock|
						mock.wrap(:today) do |original|
							if @current_time
								@current_time.to_date
							else
								original.call
							end
						end
					end
					
					mock(::DateTime) do |mock|
						mock.wrap(:now) do |original|
							if @current_time
								@current_time.to_datetime
							else
								original.call
							end
						end
					end
				end
			end
		end
	end
end
