set -e
./initBuild.sh
sudo docker-compose stop
sudo docker network prune -f
if ! sudo docker network inspect archpkgcompare_webserver_default ; then
  sudo docker network create archpkgcompare_webserver_default
fi
sudo docker-compose build
sudo docker-compose up -d
