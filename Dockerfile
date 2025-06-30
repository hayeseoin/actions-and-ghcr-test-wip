FROM fedora:42

RUN dnf install -y git stow curl wget vim sudo unzip
RUN mkdir -p /root/.ssh && touch /root/.ssh/known_hosts

WORKDIR /root

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install

RUN mkdir -p .ssh && touch .ssh/known_hosts
RUN curl -s https://raw.githubusercontent.com/hayeseoin/bootstrapper-wip/refs/heads/main/scripts-and-config/main.sh | bash -s "http"

ENTRYPOINT ["/bin/bash"]