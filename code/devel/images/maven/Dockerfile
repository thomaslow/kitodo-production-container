FROM openjdk:11

# install developer basics
RUN apt-get update && \
    apt-get install -y git screen vim curl wget pv lsb-release curl && \
    rm -rf /var/lib/apt/lists/*

# install google chrome for selenium tests
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
	apt-get update && apt-get install -y google-chrome-stable && \
	rm -rf /var/lib/apt/lists/*

# add --no-sandbox flag for chrome to work with root user in docker container
RUN sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome

# install build and test requirements
RUN apt-get update && \
    apt-get install -y maven imagemagick mariadb-client xvfb libxrender1 && \
    rm -rf /var/lib/apt/lists/*

# default workspace location
WORKDIR /workspace

# keep maven container running for development work 
# (e.g. vscode remote development plugin)
# don't do this other than for development purposes
ENTRYPOINT ["tail", "-f", "/dev/null"]