require 'riemann/client'

host = `docker-machine ip default`.chop
port = 5555
timeout = 5

c = Riemann::Client.new host: host, port: port, timeout: timeout
5.times {
  c << {
    service: 'zombie',
    description: 'the end of the world',
    tags: ['survival', 'horror'],
    metric: 0.1
  }
}
