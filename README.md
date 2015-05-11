## A Dockerfile for the [ArchiveTeam Warrior](http://www.archiveteam.org/index.php?title=ArchiveTeam_Warrior) Manual Scripts

![Warrior logo](http://www.archiveteam.org/images/thumb/f/f3/Archive_team.png/235px-Archive_team.png)
![Docker logo](https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_%28container_engine%29_logo.png)

Build, run, pull project from [git](https://github.com/ArchiveTeam/) and run script. 

This dockerfile creates a container with all basic dependencies installed, speeding up the process of creating multiple containers to run ArchiveTeam Warrior [projects](http://tracker.archiveteam.org/).

Available as a build on the index as [`infrequent/at-as-dockerfile`](https://registry.hub.docker.com/u/infrequent/at-as-dockerfile/) so you can just:


	docker pull infrequent/at-as-dockerfile
	docker run -t -i infrequent/at-as-dockerfile /sbin/my_init -- bash -l

	# you will now be inside the created container
	# all you need to do now is pull the project
	# example: https://github.com/ArchiveTeam/lastfm-grab#for-debianubuntu
		su -c "cd /home/archiveteam; git clone https://github.com/ArchiveTeam/lastfm-grab.git; cd lastfm-grab; ./get-wget-lua.sh" archiveteam
	# and start the script
		screen su -c "cd /home/archiveteam/lastfm-grab/; run-pipeline pipeline.py --concurrent 2 --address '127.0.0.1' YOURNICKHERE" archiveteam


	# to detach from GNU Screen [... ctrl+A D to detach ...]
	# to reattach to GNU Screen [... screen -D -RR ...] 

	# to detach from Container [... ctrl+P Q to detach ...]
	# to reattach to Container [... docker attach dockerid ...]

If you want to stop the script, please do it gracefully if possible. To do so, create an empty file named **STOP** in the folder of the script (terminal command:` touch STOP`). The script finishes the current item(s) and stops only after that. (If you kill the script immediately, the items get broken, and they will need to be reassigned to another user.) – Before starting the script again, don't forget to remove the STOP file.
If you see "Project code is out of date", kill the script, go to its folder (`cd projectfile`) and issue `git pull https://github.com/ArchiveTeam/projectname`. After the updating has finished, re-launch the script.

You can stop and resume the Container with `docker stop` and `docker start` and restart with `docker restart`.
