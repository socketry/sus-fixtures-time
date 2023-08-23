
def measure
	puts "duration,difference,actual"
	
	(1..100).each do |i|
		duration = (i*10.0) / 1000.0
		
		start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
		difference = sleep(duration) - duration
		actual = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time
		error = actual - duration
		
		puts "#{duration},#{difference},#{actual},#{error}"
	end
end
