# Scheduler

Currently takes a csv with rows symbolizing the individual actors and the columns afte the first as the slots. You can call the Scheduler with the csv, it will find all of the combinations of users that can be put into slots.

# Filters

You can further filter the results by adding filters to the scheduler after instantiation.

```
schedule = Scheduler.new('./example/schedule.csv')
# User will not be chosen for 2 slots back to back
schedule.add_filter(:no_consecutive_chosen, 2)
# User will not be chosen for more than 3 slots
schedule.add_filter(:max_used, 3)
schedule.find_schedules
```
