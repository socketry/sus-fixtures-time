# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023-2024, by Samuel Williams.

module Sus
	module Fixtures
		module Time
			# Represents the smallest possible time interval that can be measured given the current system overheads.
			class Quantum
				# Resolve the quantum for the current system.
				#
				# @returns [Float] The quantum for the current system in seconds.
				def self.resolve
					self.new.to_f
				end
				
				# @returns [Float] the quantum for the current system in seconds.
				def to_f
					precision
				end
				
				# Lazily compute the precision of the current system.
				#
				# @returns [Float] the quantum for the current system in seconds.
				def precision
					@precision ||= self.measure_host_precision
				end
				
				# Measure the precision of the current system.
				#
				# @parameter repeats [Integer] The number of times to repeat the measurement.
				# @parameter duration [Float] The duration of the measurement in seconds.
				# @parameter factor [Float] A scaling factor to apply to the measured overhead.
				# @returns [Float] the quantum for the current system in seconds.
				def measure_host_precision(repeats: 1000, duration: 0.1, factor: 2.0)
					step = duration / repeats
					
					start_time = self.now
					repeats.times do
						sleep(step)
					end
					end_time = self.now
					
					actual_duration = end_time - start_time
					
					if actual_duration < duration
						warn "Expected to sleep for #{duration}+ seconds, but only slept for #{actual_duration} seconds."
						error = 0.1
					else
						# Total execution time, minus the expected execution time = overhead.
						error = actual_duration - duration
					end
					
					# It's not like this is a precise measurement anyway...
					return error * factor
				end
				
				private
				
				def now
					Process.clock_gettime(Process::CLOCK_MONOTONIC)
				end
			end
			
			QUANTUM = Quantum.resolve
		end
	end
end
