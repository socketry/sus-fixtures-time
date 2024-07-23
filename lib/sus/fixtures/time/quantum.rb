# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023-2024, by Samuel Williams.

module Sus
	module Fixtures
		module Time
			class Quantum
				def self.resolve
					self.new.to_f
				end
				
				def to_f
					precision
				end
				
				def precision
					@precision ||= self.measure_host_precision
				end
				
				def measure_host_precision(repeats: 1000, duration: 0.1, factor: 2.0)
					step = duration / repeats
					
					start_time = self.now
					repeats.times do
						sleep(step)
					end
					end_time = self.now
					
					# Total execution time, minus the expected execution time = overhead.
					error = (end_time - start_time) - duration
					
					# It's not like this is a precise measurement anyway...
					return error * factor
				end
				
				def calculate_mean(values)
					values.sum.to_f / values.size
				end
				
				def calculate_standard_deviation(values, mean)
					variance = values.inject(0.0){|sum, value| sum + (value - mean) ** 2} / values.size
					Math.sqrt(variance)
				end
				
				def now
					Process.clock_gettime(Process::CLOCK_MONOTONIC)
				end
			end
			
			QUANTUM = Quantum.resolve
		end
	end
end
