# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023-2024, by Samuel Williams.

require 'sus/fixtures/time/quantum'

describe Sus::Fixtures::Time do
	it "should measure host precision" do
		expect(subject::QUANTUM).to be_a(Float)
		expect(subject::QUANTUM).to be > 0.0
	end
	
	it "should be a reasonable value" do
		durations = [0.01, 0.1, 1.0]
		
		durations.each do |duration|
			expect{sleep(duration)}.to have_duration(be < (duration + subject::QUANTUM))
		end
	end
end
