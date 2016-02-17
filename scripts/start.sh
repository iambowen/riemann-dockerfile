#!/bin/bash

# start riemann
riemann &

# start riemann dashboard
riemann-dash /etc/riemann/riemann-dash-config.rb
