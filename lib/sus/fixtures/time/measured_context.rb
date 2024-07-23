# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require_relative 'quantum'

module Sus
	module Fixtures
		module Time
			# A context for comparing measured durations, taking into account the overhead (quantum) of the system.
			module MeasuredContext
				# The measured duration is less than the given duration plus the quantum.
				#
				# @parameter duration [Numeric] The expected duration.
				def be_measured_faster_than(duration)
					be < (duration + QUANTUM)
				end
				
				# The measured duration is greater than the given duration minus the quantum.
				#
				# @parameter duration [Numeric] The expected duration.
				def be_measured_slower_than(duration)
					be > (duration - QUANTUM)
				end
				
				# The measured duration is within the given duration plus or minus the quantum.
				#
				# @parameter duration [Numeric] The expected duration.
				def be_measured_within(duration)
					be_within(QUANTUM).of(duration)
				end
			end
		end
	end
end
