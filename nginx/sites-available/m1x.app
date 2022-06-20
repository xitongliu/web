server {
  listen 443 ssl http2 proxy_protocol;
  server_name           m1x.app;
  ssl_certificate /etc/letsencrypt/live/m1x.app/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/m1x.app/privkey.pem; # managed by Certbot

  access_log /var/log/nginx/m1x.app.access.log main;
  error_log /var/log/nginx/m1x.app.error.log warn;

  location / {
    root   /srv/http/m1x.app;
    index  index.html index.htm;
  }

  location ~ /\.git {
    deny all;
  }

  error_page   500 502 503 504  /50x.html;
  gzip on;
}
