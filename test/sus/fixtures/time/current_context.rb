# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'sus/fixtures/time/current_context'

describe Sus::Fixtures::Time::CurrentContext do
	with '.include_context' do
		include_context Sus::Fixtures::Time::CurrentContext, Time.at(0)
		
		it "should mock time" do
			expect(::Time.now).to be == Time.at(0)
		end
	end
	
	with '.include' do
		include Sus::Fixtures::Time::CurrentContext
		
		it "should mock time" do
			self.current_time = Time.at(0)
			
			expect(::Time.now).to be == Time.at(0)
		end
		
		it 'should return the current time' do
			self.current_time = Time.at(0)
			
			expect(Time.now).to be == Time.at(0)
			
			time_travel(Time.at(1)) do
				expect(Time.now).to be == Time.at(1)
			end
		end
	end
end
