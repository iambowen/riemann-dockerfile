# riemann-dockerfile
Dockerfile to play around with riemann, influxdb and grafana.

## How to run this?

To run this project you will need docker.
Follow these steps and everything will be up and running!

```
$ docker-machine start
$ eval $(docker-machine env)
$ docker-compose build
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

# InfluxDB
**Ports:**

* `8083`: InfluxDB Admin Interface
* `8086`: InfluxDB HTTP API

**Enviroment:**

* `HTTP_USER`: admin
* `HTTP_PASS`: admin
* `INFLUXDB_PROTO`: http
* `INFLUXDB_HOST`: influxdb
* `INFLUXDB_PORT`: 8086
* `INFLUXDB_NAME`: metrics_db
* `INFLUXDB_USER`: riemann
* `INFLUXDB_PASS`: riemann

# Grafana
**Ports:**

* `8080`: Grafana Dasboard

**Enviroment:**

* `ADMIN_USER`: riemann
* `INFLUXDB_INIT_PWD`: riemann
* `PRE_CREATE_DB`: metrics_db
