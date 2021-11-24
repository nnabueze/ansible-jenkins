# Extend Jenkins 2.303.3 on Debian 11 (stretch)
FROM jenkins/jenkins:2.303.3-lts

# Switch to root user to install .NET SDK
USER root

# Print kernel and distro info
RUN echo "Distro info:" && uname -a && cat /etc/*release

# Install needed tools and upgrade installed packages
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
curl apt-transport-https software-properties-common \
&& apt-get upgrade -y

# Add Microsoft repository for .NET SDK
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-add-repository https://packages.microsoft.com/debian/11/prod/

# Install .NET SDK
RUN apt-get update \
&& apt-get install -y dotnet-sdk-3.1
RUN apt-get install -y dotnet-sdk-5.0

RUN apt-get update \
&& apt install -y build-essential
RUN apt install -y nodejs
RUN apt install -y npm
RUN apt remove docker docker-engine docker.io containerd runc
RUN apt-get update
RUN apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

# Switch back to jenkins user
# USER jenkins