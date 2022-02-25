FROM gitpod/workspace-postgresql

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install erlang -y \
    && apt-get install elixir -y \
    && apt-get install inotify-tools -y \
    && mix local.hex --force \
    && mix local.rebar --force \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Allow gitpod group to edit 
RUN true \
    && sudo chown -R root:gitpod /home/gitpod/.mix \
    && sudo chmod -R g+rw /home/gitpod/.mix
