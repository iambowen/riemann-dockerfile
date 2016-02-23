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
# Generate events
```
$ watch -n 1 ruby tests/sample_request.rb
```
