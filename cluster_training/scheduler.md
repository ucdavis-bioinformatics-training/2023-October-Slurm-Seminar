
# The cluster cafe

You can think of the cluster as a restaurant:

- 'Jobs' are parties coming to eat
- 'Tables' are the nodes of the cluster

Not all tables will be the same size, or have the same attributes.

Your queue wait times will depend on what resources you are asking for.

- A single free seat at a shared table is quicker to free up than a table
  for 10.

# The cluster cafe

## It is possible to request other resources when you submit your job

	"I'd like a table by the window"

## Or even request a specific node

	"I want to sit at table 2. I'll wait."

## Normally the scheduler will "seat" as many jobs at the same table as it can, but you can request a table by yourself with `--exclusive`

## The scheduler will wait to run your job until it can fulfill your requirements.

## It is important to remember that you are only requesting resources.  

Just like requesting a table for 10 doesn't mean 10 people will show up to
lunch, requesting 10 CPUs doesn't mean your job will magically use all 10.
