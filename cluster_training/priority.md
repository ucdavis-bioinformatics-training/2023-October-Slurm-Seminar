
# Priority

You can view your lab's current priority on the computing portal under
the "slurm accounts" tab.

You can also view your priority on the command line line using the `sshare`
command:

	Account       User  RawShares  NormShares    RawUsage  EffectvUsage  FairShare 
	 rcc                                712954    0.004252     1183660      0.000097            
	  rcc                      adam     parent    0.004252           0      0.000000   0.789897 
	  rcc                  buduchin     parent    0.004252           0      0.000000   0.789897 
	  rcc                   mclewis          1    0.111111        1697      0.001434   0.763490 
	  rcc                    mozart          1    0.111111           0      0.000000   0.789897 
	  rcc                  msettles          1    0.111111           0      0.000000   0.789897 
	  rcc                oschreiber     parent    0.004252           0      0.000000   0.789897 
	  rcc                   posmani     parent    0.004252           0      0.000000

- account is a SLURM account, not a UNIX account.  You can think of it like a
bank account that keeps track of your cluster usage.

- Typically each lab will have one account, though users may sometimes 
have than one account.  In that case they will have to choose which account to
"charge" for their usage when jobs are submitted.

- FairShare is a  value between 0 and 1 that represents your priority (1 is 
highest; 0 lowest).  A priority of .5 means you are using the cluster 
equivalent to your buy-in.  Above .5 means you are using less, and below
means you are using more.

- FairShare priority recovers over time as the cluster is used less by 
that account.  The idea is to average out your buy-in over time while 
still allowing you to exceed it for brief periods.

- You can request additional priority using the portal, under the
"Request forms" tab.

# sprio

To view where your jobs are in the queue, you can use the `sprio` command.

