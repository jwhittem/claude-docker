FROM node:lts-bookworm-slim

ARG CLAUDE_CODE_VERSION=latest

# Install basic development tools and iptables/ipset
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  fzf \
  gh \
  git \
  gnupg2 \
  jq \
  man-db \
  nodejs \
  npm \
  python3 \
  python3-pip \
  software-properties-common \
  sudo \
  unzip \
  vim \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/terraform/1.13.4/terraform_1.13.4_linux_amd64.zip
RUN unzip terraform_1.13.4_linux_amd64.zip && mv terraform /usr/bin
RUN pip install --break-system-packages uv
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install
WORKDIR /workspace

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin:/home/node/.local/bin
ENV SHELL=/bin/bash
ENV EDITOR=vim
ENV CLAUDE_CONFIG_DIR=/home/node/.claude

RUN npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}

COPY start.sh /

ENTRYPOINT ["/start.sh"]
