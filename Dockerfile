FROM nvidia/cuda:10.2-base-ubuntu18.04
WORKDIR /miner
RUN apt-get update && apt-get install -y --no-install-recommends wget zutils tar
RUN wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz 
RUN gunzip ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz 
RUN tar xfv ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar 
RUN rm -f ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar
RUN chmod +x bin/ethminer
ENTRYPOINT [ "bin/ethminer" ]
CMD [ "-U" ]