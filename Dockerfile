FROM centos:8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

RUN yum upgrade -y

LABEL "com.github.actions.name"="Butler Push"
LABEL "com.github.actions.description"="Publishes releases to Itch.io using Butler"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="white"

RUN dnf install unzip -y

# Install Butler
RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default \
    && unzip butler.zip \
    && cp butler /usr/bin \
    && chmod +x /usr/bin/butler

# Run butler push
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
