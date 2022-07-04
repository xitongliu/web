server {
    listen 80;

    server_name m1x.app;
    server_tokens off;

    access_log /srv/log/m1x.app/access.log main;
    error_log /srv/log/m1x.app/error.log warn;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 301 https://m1x.app$request_uri;
    }
}

server {
  listen 443 ssl http2 proxy_protocol;
  server_name           m1x.app;
  ssl_certificate /etc/cloudflare/ssl/m1x.app/cert.pem;
  ssl_certificate_key /etc/cloudflare/ssl/m1x.app/key.pem;
  ssl_client_certificate /etc/cloudflare/ssl/cloudflare.crt;
  ssl_verify_client on;

  access_log /srv/log/m1x.app/access.log main;
  error_log /srv/log/m1x.app/error.log warn;

  location / {
    root   /var/www/html/m1x.app;
    index  index.html index.htm;
  }

  location ~ /\.git {
    deny all;
  }

  error_page   500 502 503 504  /50x.html;
  gzip on;
}
