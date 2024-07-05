FROM ubuntu:14.04
ENV DEBIAN_FRONTEND=noninteractive
#ADD jre-8u202-linux-x64.tar.gz /root
#ENV JAVA_HOME=/root/jre1.8.0_202
#ENV PATH=$JAVA_HOME/bin:$PATH

RUN groupadd -g 1000 elasticsearch && useradd elasticsearch -u 1000 -g 1000

RUN apt-get update
RUN apt-get install wget
RUN wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.3.5.deb
RUN dpkg -i elasticsearch-2.3.5.deb

WORKDIR /usr/share/elasticsearch
RUN set -ex && for path in data logs config config/scripts; do \
        mkdir -p "$path"; \
        chown -R elasticsearch:elasticsearch "$path"; \
    done

COPY logging.yml /usr/share/elasticsearch/config/
COPY elasticsearch.yml /usr/share/elasticsearch/config/

USER elasticsearch
ADD jre-8u202-linux-x64.tar.gz /usr/share/elasticsearch
ENV JAVA_HOME=/usr/share/elasticsearch/jre1.8.0_202
ENV PATH=$JAVA_HOME/bin:/usr/share/elasticsearch/bin:$PATH
CMD ["elasticsearch"]
EXPOSE 9200 9300

#ENTRYPOINT /etc/init.d/elasticsearch start && update-rc.d elasticsearch defaults && bash
