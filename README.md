# riemann-dockerfile
Dockerfile to play around with riemann.

# Build image from Dockerfile
```
$ docker build -t <tag> .
```

# Run container with riemann image
```
$ docker run -p 4567:4567 -p 5555:5555/tcp -p 5555:5555/udp -p 5556:5556 <tag>
```
or
```
$ docker-compose up
```

# Generate events
```
$ watch -n 1 ruby tests/sample_request.rb
```

# Email notifications
To read your email notifications, you can use the maildev's web interface
available on the port 80 in your docker machine.

```
$ open "http://$(docker-machine ip default)"
```
