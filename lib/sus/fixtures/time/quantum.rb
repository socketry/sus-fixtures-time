# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

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
				
				def measure(repeats, duration)
					start_time = self.now
					repeats.times do
						sleep(duration)
					end
					end_time = self.now
					
					return (end_time - start_time) - (repeats * duration)
				end
				
				def measure_host_precision(repeats = 100, duration = 0.001)
					actual_duration = measure(repeats, duration) - measure(repeats, 0)
					error = actual_duration / repeats
					
					if error < 0.0
						warn "Invalid precision measurement: #{actual_duration} < #{expected_duration}"
						return 0.1
					end
					
					# This computes the overhead of sleep, called `repeats` times:
					return error
				end
				
				def now
					Process.clock_gettime(Process::CLOCK_MONOTONIC)
				end
			end
			
			QUANTUM = Quantum.resolve
		end
	end
end
