docker rm -f plmxs_node
docker build  --network="host" -t plmxs_node . 
docker run -dit --net=host -v  /home:/home -v /dev:/dev  -v /etc:/etc --privileged=true --name=plmxs_node plmxs_node

# $(pwd)/out:/out