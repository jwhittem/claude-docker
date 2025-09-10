# claude-docker
running claude code in a container

## Building

Just run `make`

## Running

docker run -it -v ${HOME}/.claude:/home/node/.claude -v .:/workspace claude-cli