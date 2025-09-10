# claude-docker
running claude code in a container

## Building

Just run `make`

## Add bash alias

alias claude="docker run -it -v ${HOME}/.claude:/home/node/.claude -v .:/workspace claude-cli"

