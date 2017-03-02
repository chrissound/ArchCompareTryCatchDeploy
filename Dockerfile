FROM haskell:8.0.2

# Add the apk repository
# RUN echo "https://s3-us-west-2.amazonaws.com/alpine-ghc/next/8.0" >> /etc/apk/repositories

# Make sure I built my own apks... >.<
#COPY mitch.tishmack@gmail.com-55881c97.rsa.pub /etc/apk/keys/mitch.tishmack@gmail.com-55881c97.rsa.pub

RUN cabal update && stack update
#ENV PATH ${PATH}:/root/.cabal/bin

#WORKDIR ArchPackageCompareStats
#RUN apt-get install build-essential

#CMD stack build -v
RUN apt-get update
RUN apt-get install -y openssh-client
RUN mkdir /root/server
WORKDIR /root/server
COPY deploy .
RUN stack install --local-bin-path /root/server/ ArchPackageCompareStats
RUN stack install -v ArchPackageCompareStats
ENTRYPOINT webserver "/compare/package"
