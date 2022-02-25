FROM gitpod/workspace-postgresql

USER gitpod

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update \
    && sudo apt-get install erlang -y \
    && sudo apt-get install elixir -y \
    && sudo apt-get install inotify-tools -y \
    && mix local.hex --force \
    && mix local.rebar --force \
    && sudo apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Allow gitpod group to edit 
# RUN true \
# 	&& sudo chown -R root:gitpod /home/gitpod/.mix \
#     && sudo chmod -R g+rw /home/gitpod/.mix
