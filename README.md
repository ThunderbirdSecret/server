# server

Ft_server on subject for Haute Ecole42. Level 2 

To run, download docker, clone repositorie. In the root folder of the repository, enter the command:

$bash script.sh

The script.sh file includes all the necessary rules for stopping and deleting already running docker files and starting an existing one. 

To remove the current docker type:

$ docker stop server-21
  docker rm $(docker ps -qa)
  docker rmi $(docker images -q)
