require 'riemann/client'

def random_creature()
  ['zombie', 'vampire', 'werewolf', 'unicorn'].sample
end

def random_weapon()
  ['shotgun', 'ak47', 'railgun', 'bfg'].sample
end

def random_player()
  ['chris', 'wesker', 'jill', 'claire'].sample
end

def random_metric(range)
  rand(range)
end

host = `docker-machine ip default`.chop
port = 5555
timeout = 5

c = Riemann::Client.new host: host, port: port, timeout: timeout

### Generate some scary events
100.times {
  c << {
    service: "#{random_creature()} killed",
    description: 'number of creatures killed',
    tags: ['creature'],
    metric: random_metric(0..10)
  }
  c << {
    service: "#{random_weapon()} ammo total",
    description: 'total ammo left',
    tags: ['weapon'],
    metric: random_metric(0..100)
  }
  c << {
    service: "#{random_player()} health total",
    description: 'player health',
    tags: ['player'],
    metric: random_metric(0..100)
  }
}
