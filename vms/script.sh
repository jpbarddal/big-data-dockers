#/bin/bash
docker stop $(docker ps -a -q)
docker system prune --force
docker network create compartilhada
docker-compose up -d
sleep 30s
docker-compose exec resourcemanager apt-get update
docker-compose exec -d resourcemanager apt-get -y install python3
docker-compose exec nodemanager1 apt-get update
docker-compose exec -d nodemanager1 apt-get -y install python3
docker-compose exec nodemanager2 apt-get update
docker-compose exec -d nodemanager2 apt-get -y install python3
docker-compose exec nodemanager3 apt-get update
docker-compose exec -d nodemanager3 apt-get -y install python3
docker ps -q | xargs docker inspect --format "{{range .NetworkSettings.Networks}}{{print .IPAddress}} {{end}}{{.Name}}"
sh abre_navegador.sh
echo "Pronto! =)"
