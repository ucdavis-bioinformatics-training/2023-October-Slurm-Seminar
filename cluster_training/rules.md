
# Things to do

-  Use the scheduler! (i.e. do not ssh to nodes to run)
-  Give good estimates of your job's needs.  If your job can be split
   into smaller sections, you may get scheduled sooner, as the scheduler
   will try to backfill shorter jobs.
-  Limit use of interactive sessions
-  Checkpoint your job if possible
-  Make use of local storage on the nodes for intermediate results

# Things NOT to do

-  Run jobs on the head node
-  Many simultaneous writes to network filesystem- use local scratch if you
   can!
-  Go around scheduler and run directly on the nodes
