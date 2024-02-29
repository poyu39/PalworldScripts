#!/bin/sh

RCON_PORT=""
ADMIN_PASSWORD=""

TIME_TO_BROADCAST=(60 30 10 5 4 3 2 1)
TIMER=60

echo "Save" | ./ARRCON -P $RCON_PORT -p $ADMIN_PASSWORD

echo "Shutdown ${TIMER}" | ./ARRCON -P $RCON_PORT -p $ADMIN_PASSWORD

while [ $TIMER -gt 0 ]
do
    if [[ " ${TIME_TO_BROADCAST[@]} " =~ " $TIMER " ]]; then
        echo "Broadcast Server_will_restart_in_${TIMER}_seconds" | ./ARRCON -P $RCON_PORT -p $ADMIN_PASSWORD
    fi
    sleep 1
    TIMER=$((TIMER-1))
done

# docker restart

cd "path to docker-compose.yml file"
docker compose restart