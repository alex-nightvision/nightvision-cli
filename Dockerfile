# Use the official Python image, which is Debian-based
FROM python:3.10-slim

# Install curl and tar
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Install Semgrep
RUN pip install semgrep

# Download and install the nightvision software
RUN curl -L https://downloads.nightvision.net/binaries/latest/nightvision_latest_linux_amd64.tar.gz -q | tar -xz \
    && mv nightvision /usr/local/bin/

# Set the working directory to /mnt
WORKDIR /mnt

# Default command
CMD ["bash"]

## example use
# docker run -v $(pwd):/mnt -it --env "NIGHTVISION_TOKEN=$(nightvision token create)" cohenaj194/nightvision-cli 

## JAVA SPRING
# nightvision swagger extract ./ -t javaspringvulny-api --lang spring

## DOTNET
# nightvision swagger extract ./ -t universalis --lang dotnet