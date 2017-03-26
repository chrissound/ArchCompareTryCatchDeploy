pwd=`pwd`
sudo docker build -t arch_pkg_compare_webserver .
if [ -d "data/ArchPackageCompareStats" ] ; then
    cd data/ArchPackageCompareStats
    git pull
    cd $pwd
fi
if [ ! -d "data/ArchPackageCompareStats" ] ; then
    git clone git@github.com:chrissound/ArchPackageCompareStats.git data/ArchPackageCompareStats
fi

sudo docker network prune
sudo docker network create archpkgcompare_webserver_default
sudo docker-compose up -d
