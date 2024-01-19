# nightvision-cli

Containerized nightvision CLI for running API Envy on windows.

## example use
```
nightvision login
docker run -v $(pwd):/mnt -it --env "NIGHTVISION_TOKEN=$(nightvision token create)" cohenaj194/nightvision-cli 
nightvision swagger extract ./ -t universalis --lang dotnet
```