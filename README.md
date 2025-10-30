# claude-docker
running claude code in a container

## Building

Just run `make`

## Add bash alias

alias claude="<path>/claude-run.sh"

### Using the container via shell script

```
docker run -it \
 -e AWS_REGION=us-east-2 \
 -v .:/workspace \
 -v $HOME/.aws-claude:/root/.aws \
 -v $HOME/.claude:/home/node/.claude \
 claude-cli:latest 
```