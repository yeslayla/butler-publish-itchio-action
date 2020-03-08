FROM centos:8

LABEL "com.github.actions.name"="Butler Push"
LABEL "com.github.actions.description"="Publishes releases to Itch.io using Butler"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="white"

# Install Butler
ADD https://dl.itch.ovh/butler/linux-amd64/head/butler /usr/bin/
RUN chmod +x /usr/bin/butler
RUN butler upgrade --assume-yes

# Run butler push
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
