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

def calculate_state(metric)
  case metric
    when 1..30 then 'critical'
    when 31..60 then 'warning'
    else 'ok'
  end
end

def generate_creature_event(c)
  metric = random_metric(0..100)
  c << {
    service: "#{random_creature()} killed",
    description: 'number of creatures killed',
    tags: ['creature'],
    state: calculate_state(metric),
    metric: metric
  }
end

def generate_gun_event(c)
  metric = random_metric(0..100)
  c << {
    service: "#{random_weapon()} ammo total",
    description: 'total ammo left',
    tags: ['weapon'],
    state: calculate_state(metric),
    metric: metric
  }
end

def generate_player_event(c)
  metric = random_metric(0..100)
  c << {
    service: "#{random_player()} health total",
    description: 'player health',
    tags: ['player'],
    state: calculate_state(metric),
    metric: metric
  }
end

#host = `docker-machine ip default`.chop
host = "127.0.0.1"
port = 5555
timeout = 5

c = Riemann::Client.new host: host, port: port, timeout: timeout

### Generate some scary events
generate_creature_event(c)
generate_gun_event(c)
generate_player_event(c)
