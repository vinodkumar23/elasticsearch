1. Clone the Project from GitHub (Credentials not required)
 $git clone https://github.com/vinodkumar23/elasticsearch.git

2. Build the docker image (I built this image on Ubuntu 22.04)
 $docker build -t my-es-image .

3. Creaete Volume for Persistant storage 
 $docker volume create --name esdata

4. Create the container with Volume attachment & Allocating 4GB dedicated memory for contianer & with ENV variable for HEAM Memory of 2GB
 $docker run --rm -ti -p 9200:9200 -v esdata:/usr/share/elasticsearch/data --memory="4g" -e ES_HEAP_SIZE=2g my-es-image
 
5. OUTPUT
http://172.17.02:9200 (http://YOURIP:9200)

JSON Output from the browser:
====
{
  "name" : "Agent Zero",
  "cluster_name" : "docker-cluster",
  "version" : {
    "number" : "2.3.5",
    "build_hash" : "90f439ff60a3c0f497f91663701e64ccd01edbb4",
    "build_timestamp" : "2016-07-27T10:36:52Z",
    "build_snapshot" : false,
    "lucene_version" : "5.5.0"
  },
  "tagline" : "You Know, for Search"
}

