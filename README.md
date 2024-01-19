# nightvision-cli

Containerized nightvision CLI for running API Envy Swagger Extraction on windows.

## example use
```
# clone vulny app
git clone https://github.com/nvsecurity/java-github-actions-demo.git
cd java-github-actions-demo/

# log in through local cli to produce a token
nightvision login

# start the nightvision-cli container with the cli ready to go 
# and access to the local codebase of "java-github-actions-demo"
docker run -v $(pwd):/mnt -it --env "NIGHTVISION_TOKEN=$(nightvision token create)" cohenaj194/nightvision-cli 

# create an app and target if none exist
URL="https://localhost:9000"
APP="javaspringvulny-api"
nightvision app create -n $APP
nightvision target create -n $APP -u $URL --type api

# extract swagger openapi-spec.yml that will appear in the local development environment and container
nightvision swagger extract ./ -t $APP --lang spring
```