FROM registry.access.redhat.com/ubi7/ubi
RUN rpm --import https://packages.treasuredata.com/GPG-KEY-td-agent
COPY td.repo /etc/yum.repos.d/td.repo
RUN yes | yum install -y td-agent && /usr/sbin/td-agent-gem install fluent-plugin-bigquery
RUN chmod 777 /var/log/td-agent
USER td-agent
ENTRYPOINT /opt/td-agent/embedded/bin/fluentd
