# HPCCF cluster onboarding basic training materials

These materials are intented to be divided into modular sections so the
content is as flexible as possible for use with different clusters.

README.md - this file
intro.md - intro to clusters/the core facility
lssc0_onboard.md - onboarding to LSSC0
modules.md - using environment modules
ppt-template - powerpoint templates
priority.md - how SLURM priority works 
q_commands.md - Old SGE documentation
rules.md - Do's and Don'ts
s_commands.md - Basic SLURM commands and example job
scheduler.md - scheduler basics
transfer.md - copying files back and forth

# To build PPT presentation 

Combine desired sections and apply template:

   cat intro.md lssc0_onboard.md s_commands.md rules.md priority.md | \
   pandoc --reference-doc OOR-template/2021-OOR-Tree-Template.potx \
   -o cluster.pptx


