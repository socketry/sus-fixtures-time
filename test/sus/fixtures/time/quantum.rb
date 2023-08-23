# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'sus/fixtures/time/quantum'

describe Sus::Fixtures::Time do
	it "should measure host precision" do
		expect(subject::QUANTUM).to be_a(Float)
		expect(subject::QUANTUM).to be > 0.0
	end
	
	it "should be a reasonable value" do
		10.times do
			expect{sleep(1)}.to have_duration(be_within(subject::QUANTUM).of(1))
		end
	end
end
