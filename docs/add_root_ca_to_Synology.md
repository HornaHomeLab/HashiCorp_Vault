# Add CA cert to Synology

## Purpose

Synology DSM by default does not trust any docker registry without valid certificate.
To enable downloading docker images from local registry we need to add root cert to trusted ones in Synology OS

## Instruction

1. Run [`vault-fetch-root-ca.sh`](/scripts/vault-fetch-root-ca.sh), to download root CA locally. It should be saved as `root-ca.crt` in current directory
2. Upload it to any Synology share.
3. Connect via SSH to Synology Disk Station
4. Copy uploaded cert to required `/etc/ssl/certs`, using:

```shell
cp ./root-ca.crt /etc/ssl/certs/<your_domain>root-ca.crt
```

5. Login as a root: `sudo -i`

6. Create a “hash-named” symlink, using:

```shell
ln -s /etc/ssl/certs/<your_domain>root-ca.crt /etc/ssl/certs/`openssl x509 -hash -noout -in /etc/ssl/certs/<your_domain>root-ca.crt`.1
```
