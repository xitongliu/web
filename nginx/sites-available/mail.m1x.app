server {
    listen 80;

    server_name mail.m1x.app;
    server_tokens off;

    access_log /srv/log/mail.m1x.app/access.log main;
    error_log /srv/log/mail.m1x.app/error.log warn;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 301 https://mail.m1x.app$request_uri;
    }
}
