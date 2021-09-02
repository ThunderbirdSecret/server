docker stop server-21
docker rm $(docker ps -qa)
docker rmi $(docker images -q)
docker build -t ft_server .
docker run --name server-21 -d -p 80:80 -p 443:443 --hostname host ft_server
