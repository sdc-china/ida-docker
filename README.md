## Download docker compose scripts
```
git clone https://github.com/sdc-china/ida-docker.git
cd ida-docker
```

## Load IDA docker image
ida-22.1.3.tgz is provided in the IDA release package.
```
tar -zxvf ida-22.1.3.tgz
docker load --input images/ida-22.1.3.tar.gz
```

## Set IDA data folder permission
```
chown -R 1001:0 data/ida
```

## update .env file
Set the **DATA_PATH** to the absolution path of the **data** folder

```
DATA_PATH=/root/ida-docker/data
```

## Start IDA
```
docker-compose up -d
```

## Check IDA logs
```
docker-compose logs -f web
```

## Stop IDA web
```
docker-compose stop web
```

## Stop all components
```
docker-compose down
```

## Access IDA
You can access IDA by the url https://<HOST_IP>:9443/ida, until you see the below logs.

```
The defaultServer server started in xx seconds.
```

Default Admin Credentials: idaAdmin/idaAdmin

## Configure BPM Server
[https://sdc-china.github.io/IDA-doc/administration/administration-bpm-configuration.html](https://sdc-china.github.io/IDA-doc/administration/administration-bpm-configuration.html)

## Configure Standalone Selenium Grid Server
[https://sdc-china.github.io/IDA-doc/administration/administration-selenium-hub-configuration.html](https://sdc-china.github.io/IDA-doc/administration/administration-selenium-hub-configuration.html)

Selenium Server URL: http://<HOST_IP>:4444