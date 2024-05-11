# helloworld-rest-spring

- build image
```
docker build . -t localhost:5000/helloworld-spring
```
- run container
```
docker run -it  --name helloworld-spring -p 9001:8080 localhost:5000/helloworld-spring
```
