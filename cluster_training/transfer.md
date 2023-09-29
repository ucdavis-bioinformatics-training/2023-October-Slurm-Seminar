
# Data transfer

How to transfer data to and from the cluster

- scp - fine for individual files, GUI clients available for OSX/Windows
- rsync - better for directory structures
- git - great for scripts
- avoid transfers in the first place!

# scp

Old classic.  Quick and easy to use from the command line, and GUI clients
are available for common platforms.

- mobaXterm has built-in file transfer
- winscp
- cyberduck
- filezilla

# scp example

Example:

   scp local_file.txt username@cluster.hpc.ucdavis.edu:remote_file.txt

- If you leave off the `remote_file.txt`, the remote file will have the
  same name as the local file:

   scp local_file.txt username@cluster.hpc.ucdavis.edu:

- If you forget the colon, `scp` will revert to a local `cp` and you will
  create a file called "username@cluster" in your current directory!

# rsync

Used to synchronize (can go both ways) entire directory structures.
Gold standard for transfers of large collections of files, but performance
can suffer when transferring large numbers of small files.

- Copy only differences, don't re-copy files that have not changed (enables
  resumption of inturrupted transfers)

  rsync -a local_dir username@cluster.hpc.ucdavis.edu:

- `a` for "archive".  Will try to preserve permissions, timestamps, etc.

# git

Push/pull from a remote repository.  Allows development/testing of code on
your local workstation, push that code to repo, pull it on cluster.

And you get version control as a bonus!

# Avoid transfers in the first place

- Use wget/curl to retrieve data sets directly to cluster storage
- Edit files in-place on a login node
