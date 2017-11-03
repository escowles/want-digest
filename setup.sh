#!/bin/sh

# Set apt-get for non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# install nginx with extras
apt-get -y -qq install nginx nginx-extras

# install module
if [ ! -f /usr/share/nginx/perl/WantDigest.pm ]; then
    mkdir -f /usr/share/nginx/perl
    cp /vagrant/WantDigest.pm /usr/share/nginx/perl
fi

# install config
if ! grep -q perl_modules /etc/nginx/nginx.conf; then
    sed -i '/http {/a perl_modules perl;\
perl_require WantDigest.pm;' /etc/nginx/nginx.conf
sed -i '/location \/ {/a perl WantDigest::handler;' /etc/nginx/sites-available/default
fi

# restart nginx
service nginx restart
