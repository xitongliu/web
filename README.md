# HTTPS using Nginx and Let's encrypt in Docker

## Create the certificate using Certbot

Test run for `example.org`:
```bash
$ docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d example.org

```

Once it passes, we can re-run Certbot without the --dry-run flag:
```bash
$ docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d example.org
```

## Renew the certificates

Run the command below to renew all certificates:
```bash
$ docker compose run --rm certbot renew
```

and then restart nginx to reload the new certs.
```bash
$ docker container restart nginx
```

## Remove the certificate using Certbot

Remove `example.org` and exclude it from future auto-renewal:
```bash
docker compose run --rm  certbot delete --cert-name example.org
```

## Reference

- [HTTPS using Nginx and Let's encrypt in Docker](https://mindsers.blog/post/https-using-nginx-certbot-docker/)
