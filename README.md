# ci
CI Image - PHP 7.4, Node 12 LTS, Composer (Latest), Other utils (git wget zip unzip, openssh-client etc.)

## Build Command

```
docker build --tag desaiuditd/ci .
docker login
docker push desaiuditd/ci
```