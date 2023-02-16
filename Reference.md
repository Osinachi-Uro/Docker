1. To build Dockerfile in the same directory where it was created use:
```
sudo docker build -t laravel-docker-task .
```

2. To check list of available docker images, use:
```
sudo docker images
```

3. To remove docker image(s), use:
```
sudo docker rmi <Image ID>
```

4. To ckeck a list of both active and deleted containers use:
```
sudo docker ps -a
```

5. To build a specific Dockerfile and a name different from 'Dockerfile' but i the same directory as the main Dockerfile, use:
```
sudo docker build -t laravel-docker-db -f dbDockerfile .
```

6. To run a specific Dockerfile and a name different from 'Dockerfile' but i the same directory as the main Dockerfile, use:
```
sudo docker run -dit laravel-docker-db
```

7. To run a Dockerfile, use:
```
sudo docker run -dit -p 8080:80 laravel-docker-task
```

8. To view the log of a container to check why it exited after a run, use:
```
sudo docker logs <Container name>
```

9. To view available docker networks, use:
```
sudo docker network ls
```

10. To assign a Docker container to a particular network (which is a network called 'bridge' being assigned to a docker container called 'db' in this case), use:
```
sudo docker run -dit --name db --network bridge laravel-docker-db
```
Or a docker container called 'app' being assigned to a network called 'bridge' in the case below
```
sudo docker run -dit -p 8080:80 --network bridge --name app laravel-docker-task
```

11. To create a new docker network, use:
```
sudo docker network create <network name>
```

12. To assign a container to a network called laranet for instansce
```
sudo docker run -dit -p 8080:80 --network laranet --name app laravel-docker-task
```

13. To check network IP address fro Linux, use
```
ifconfig
```

14. To go into a docker container, in this case the container named 'app', use:
```
sudo docker exec -it app bash
```

15. To ckeck apache service status
```
service apache2 status
```

16. To build Docker Compose, use:
```
sudo docker compose build
```

17. To run Docker Compose, use:
```
sudo docker compose up
```

18. To stop and remove docker container, use:
```
sudo docker compose stop
```
```
sudo docker compose rm
```

19. To view the detais of a container, use:
```
sudo docker inspect <container name>
```
