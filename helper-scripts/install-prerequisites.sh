#!/bin/bash
#
# Install Prerequisites those mostly requires during CI pipeline build.
#

# Fail on error.
set -e

export DEBIAN_FRONTEND=noninteractive

# Install common utilities and tools.
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests \
        curl wget tar zip bzip2 unzip ca-certificates gnupg git


# Install Java.
apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	openjdk-17-jdk && \
	apt-get clean all

# Install Maven.
MVN_VERSION="3.9.5"
mkdir -p /opt/maven  && \
	wget https://dlcdn.apache.org/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz && \
	tar -xf apache-maven-${MVN_VERSION}-bin.tar.gz -C /opt/maven && \
	ln -sf /opt/maven/apache-maven-${MVN_VERSION}/bin/mvn /usr/bin/mvn && \
	rm -f apache-maven-${MVN_VERSION}-bin.tar.gz

# Install gradle.
GRADLE_VERSION="8.4"
mkdir -p /opt/gradle && \
	wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
	unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle && \
	ln -sf /opt/gradle/apache-maven-${MVN_VERSION}/bin/gradle /usr/bin/gradle && \
	rm -f gradle-${GRADLE_VERSION}-bin.zip

# Print Java version.
java -version
