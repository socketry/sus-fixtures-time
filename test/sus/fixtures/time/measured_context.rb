# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'sus/fixtures/time/measured_context'

describe Sus::Fixtures::Time::MeasuredContext do
	include subject
	
	it "should measure faster than" do
		expect{sleep(0.01)}.to have_duration(measured_faster_than(0.0))
	end
	
	it "should measure slower than" do
		expect{sleep(0.01)}.to have_duration(measured_slower_than(0.02))
	end
	
	it "should measure within" do
		expect{sleep(0.01)}.to have_duration(measured_within(0.01))
	end
end
