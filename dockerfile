FROM ubuntu:22.04
RUN	apt update && \
apt -y install wget bzip2 xz-utils  cmake vim 


# RUN wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
# RUN tar -C /usr/local/ -xvf go1.22.1.linux-amd64.tar.gz

RUN wget  https://go.dev/dl/go1.22.1.linux-arm64.tar.gz
RUN tar -C /usr/local/ -xvf go1.22.1.linux-arm64.tar.gz

RUN echo "export PATH=\$PATH:/usr/local/go/bin" > /etc/profile
ENV PATH=$PATH:/usr/local/go/bin
RUN go version

COPY ./node_exporter-1.7.0.linux-arm64.tar.gz /
# RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-arm64.tar.gz
RUN tar -xvf node_exporter-1.7.0.linux-arm64.tar.gz -C /usr/local/


#COPY ./p.yaml /usr/local/Prometheus/prometheus.yml

RUN /usr/local/node_exporter-1.7.0.linux-arm64/node_exporter &

# CMD ["/usr/local/node_exporter-1.7.0.linux-arm64/node_exporter &"]

# RUN wget https://github.com/prometheus/prometheus/releases/download/v2.51.0-rc.0/prometheus-2.51.0-rc.0.linux-amd64.tar.gz

# RUN tar -C /usr/local/ -xvf prometheus-2.51.0-rc.0.linux-amd64.tar.gz

# RUN ln -sv /usr/local/prometheus-2.51.0-rc.0.linux-amd64/ /usr/local/Prometheus

# RUN /usr/local/Prometheus/prometheus --config.file=/usr/local/Prometheus/prometheus.yml &

# # RUN apt install -y rpm systemd

# # RUN wget https://dl.grafana.com/oss/release/grafana-5.4.2-1.x86_64.rpm
# # RUN rpm -ivh --nodeps grafana-5.4.2-1.x86_64.rpm

# # # 设置工作目录  
# # WORKDIR /usr/share/grafana  
  
# # # 启动 Grafana 服务  
# # CMD ["/usr/sbin/grafana-server", \  
# #      "--config=/etc/grafana/grafana.ini", \  
# #      "--pidfile=/var/run/grafana/grafana-server.pid", \  
# #      "--packaging=rpm", \  
# #      "cfg:default.paths.logs=/var/log/grafana", \  
# #      "cfg:default.paths.data=/var/lib/grafana", \  
# #      "cfg:default.paths.plugins=/usr/share/grafana/public/plugins", \  
# #      "cfg:default.paths.provisioning=/etc/grafana/provisioning"]


# # RUN systemctl daemon-reload
# # RUN systemctl enable grafana-server.service
# # RUN systemctl start grafana-server.service
