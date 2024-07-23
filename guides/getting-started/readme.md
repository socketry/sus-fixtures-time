# Getting Started

This guide explains how to use the `sus-fixtures-time` gem to test time-related code.

## Installation

Add the gem to your project:

``` bash
$ bundle add sus-fixtures-time
```

## Usage

Given a test, that measures the duration of an operation, you can use the {ruby Sus::Fixtures::Time::MeasuredContext} to confirm the operation completes within a given time frame.

``` ruby
include Sus::Fixtures::Time::MeasuredContext

it 'should respond within the given timeout' do
	queue = Thread::Queue.new
	
	# Assume some operation that takes time:
	Thread.new do
		queue.push(:item)
	end
	
	expect{queue.pop}.to have_duration(be_measured_less_than(0.1))
end
```
