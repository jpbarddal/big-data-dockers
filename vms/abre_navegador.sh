ip_namenode=$(docker ps -q -f name=namenode | xargs docker inspect --format "{{range .NetworkSettings.Networks}}{{print .IPAddress}}{{end}}")
ip_resource=$(docker ps -q -f name=spark-master | xargs docker inspect --format "{{range .NetworkSettings.Networks}}{{print .IPAddress}}{{end}}")
token=$(docker exec -it pyspark-jupyter jupyter notebook list | tail -1 | cut -d'=' -f2 | cut -d' ' -f1)
ip_jupyter=$(docker ps -q -f name=pyspark-jupyter | xargs docker inspect --format "{{range .NetworkSettings.Networks}}{{print .IPAddress}}{{end}}")
echo $ip_resource
echo $token
echo $ip_jupyter
firefox -new-tab -url http://$ip_jupyter:8888/?token=$token -new-tab -url http://$ip_namenode:9870 -new-tab -url http://$ip_resource:8080 &
