FROM ubuntu
MAINTAINER Carlos André @carlos4ndre

# Riemann version
ENV RIEMANN_VERSION 0.2.10

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# working directory
WORKDIR /root

# Install base dependencies
RUN apt-get update && apt-get install -y wget build-essential ruby ruby-dev zlib1g-dev openjdk-7-jdk

# Install Riemann
RUN wget -q http://aphyr.com/riemann/riemann_${RIEMANN_VERSION}_all.deb
RUN dpkg -i riemann_${RIEMANN_VERSION}_all.deb

# Install Riemman dashboard
RUN gem install riemann-client riemann-tools riemann-dash

# Expose ports
EXPOSE 4567
EXPOSE 5555/tcp
EXPOSE 5555/udp
EXPOSE 5556

# Add riemann configuration and script files
ADD ./config/riemann.config /etc/riemann/riemann.config
ADD ./config/riemann-dash-config.rb /etc/riemann/riemann-dash-config.rb
ADD ./config/ws_config.json /etc/riemann/ws_config.json
ADD ./scripts/start.sh /usr/local/bin/start.sh

# Start services
CMD ["start.sh"]
