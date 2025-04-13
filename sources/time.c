#include "philo.h"

time_t	get_time_in_ms(void)
{
	struct timeval		tv;

	if (gettimeofday(&tv, NULL) != 0)
		return (0);
	return ((tv.tv_sec * 1000) + (tv.tv_usec / 1000));
}

void	philo_sleep(t_table *table, time_t sleep_time)
{
	time_t	wake_up;
	time_t	current;
	time_t	sleep_interval;
	
	wake_up = get_time_in_ms() + sleep_time;
	while ((current = get_time_in_ms()) < wake_up)
	{
		if (has_simulation_stopped(table))
			break ;
		
		if (table->nb_philos > 100)
			sleep_interval = 100;
		else
			sleep_interval = 500;
		
		usleep(sleep_interval);
	}
}

void	sim_start_delay(time_t start_time)
{
	time_t	current;
	
	while ((current = get_time_in_ms()) < start_time)
		usleep(100);
}