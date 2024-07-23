#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

// Print the duration, actual time, and error for a range of durations.
int main(int argc, char **argv)
{
	printf("duration,actual,error\n");
	
	for(int i = 1; i <= 100; i++)
	{
		double duration = (i*10.0) / 1000.0;
		
		struct timespec start_time, remainder;
		clock_gettime(CLOCK_MONOTONIC, &start_time);
		
		long seconds = (long)duration;
		long nanoseconds = (duration - seconds) * 1000000000.0;
		struct timespec requested = {seconds, nanoseconds};
		clock_nanosleep(CLOCK_MONOTONIC, 0, &requested, &remainder);
		
		struct timespec end_time;
		clock_gettime(CLOCK_MONOTONIC, &end_time);
		double actual = (end_time.tv_sec - start_time.tv_sec) + (end_time.tv_nsec - start_time.tv_nsec) / 1000000000.0;
		double error = actual - duration;
		
		printf("%f,%f,%f\n", duration, actual, error);
	}
	
	return 0;
}