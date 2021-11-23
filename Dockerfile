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
RUN apt install -y docker

# Switch back to jenkins user
USER jenkins