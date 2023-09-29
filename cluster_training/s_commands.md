
# Using the scheduler

- sbatch/srun/salloc: submit jobs
- scontrol show: get job/node status
- squeue: show jobs in the queue
- sinfo: report state of partitions and nodes
- scancel: cancel/stop a job
- scontrol update: change a job after submission
- sacct: view accounting information

# Example job script:

	#!/bin/bash
	# options for sbatch
	#SBATCH --job-name=name # Job name
	#SBATCH --nodes=1 # should never be anything other than 1
	#SBATCH --ntasks=1 # number of cpus to use
	#SBATCH --time=30 # Acceptable time formats include "minutes", "minutes:seconds", "hours:minutes:seconds", "days-hours", "days-hours:minutes" and "days-hours:minutes:seconds".
	#SBATCH --mem=500 # Memory pool for all cores (see also --mem-per-cpu)
	#SBATCH --partition=production # cluster partition
	#SBATCH --account=epigenetics # cluster account to use for the job
	#SBATCH --reservation=epigenetics-workshop # cluster account reservation
	##SBATCH --array=1-16 # Task array indexing, see https://slurm.schedmd.com/job_array.html, the double # means this line is commented out
	#SBATCH --output=stdout.out # File to which STDOUT will be written
	#SBATCH --error=stderr.err # File to which STDERR will be written
	#SBATCH --mail-type=ALL
	#SBATCH --mail-user=myemail@email.com
	
	# for calculating the amount of time the job takes and echo the hostname
begin=`date +%s`
	echo $HOSTNAME
	
	# Sleep for 5 minutes
	sleep 300

	# getting end time to calculate time elapsed
	end=`date +%s`
	elapsed=`expr $end - $begin`
	echo Time taken: $elapsed

# srun

An interactive session can be requested with `srun`.

Any options given in the script with `#SBATCH` are equivalent to using
the same options on the command line when submitting, so make sure you
copy the important ones into your srun command.

Note that all of these will be treated as comments by bash, so it is
still possible to run the script standalone.

An interactive session can be requested with `srun`:
   
   srun --time 30 --mem 500 --pty /bin/bash

Once you are allocated resources, you can run your script interactively for
debugging purposes.

Note that all of the SLURM options will be treated as comments by the shell, 
so running the script as-is is fine:

   node$ ./job.sh

# sbatch 

Once you have verified that your job is working, you can submit it to run
in batch mode:

    sbatch job.sh

# 'squeue' - list your currently queued/running jobs

# 'scancel' - cancel job (running or in queue)

To cancel a single job:

   scancel <jobid>

To cancel all your jobs, you can use -u with your username:

   scancel -u <username>

# 'sacct' - view resources used by your job

   sacct -j jobid --format=JobID,JobName,MaxRSS,Elapsed,State

- There are lots of parameters collected.  `sacct -l -j jobid` will show
many of them.
