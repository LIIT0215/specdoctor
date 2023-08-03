FROM ubuntu:20.04
# ENV http_proxy "http://docker.for.mac.host.internal:4780"
# ENV HTTP_PROXY "http://docker.for.mac.host.internal:4780"
# ENV https_proxy "http://docker.for.mac.host.internal:4780"
# ENV HTTPS_PROXY "http://docker.for.mac.host.internal:4780"
# Disable dialog questions
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install git, sudo
RUN apt update \
 && apt install -y \
    git \
    sudo

# Install specdoctor, it takes about 1 hour
WORKDIR "/root"

RUN git clone https://github.com/compsec-snu/specdoctor.git \
 && cd specdoctor \
 && echo "y" | ./setup.sh

ENTRYPOINT ["/bin/bash"]
