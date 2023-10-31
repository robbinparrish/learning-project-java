FROM debian:12.2

ENV DEBIAN_FRONTEND=noninteractive

# Perform an update.
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean all

# Install common utilities and tools.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	bash curl wget tar zip bzip2 xz-utils \
	unzip make ca-certificates gnupg \
	git git-core openssh-client vim && \
	apt-get clean all


# Install Java.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	openjdk-17-jdk && \
	apt-get clean all

# Install Maven.
ENV MVN_VERSION="3.9.5"
RUN mkdir -p /opt/maven  && \
	wget https://dlcdn.apache.org/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz && \
	tar -xf apache-maven-${MVN_VERSION}-bin.tar.gz -C /opt/maven && \
	ln -sf /opt/maven/apache-maven-${MVN_VERSION}/bin/mvn /usr/bin/mvn && \
	rm -f apache-maven-${MVN_VERSION}-bin.tar.gz

# Install gradle.
ENV GRADLE_VERSION="8.4"
RUN mkdir -p /opt/gradle && \
	wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
	unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle && \
	ln -sf /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle && \
	rm -f gradle-${GRADLE_VERSION}-bin.zip

# Print Java version.
RUN java -version

# Create default user.
ENV USER_ID=1000
ENV USER_NAME=devuser
RUN addgroup --gid ${USER_ID} ${USER_NAME} && \
	adduser --disabled-password --gecos "" \
	    --uid ${USER_ID} --gid ${USER_ID} ${USER_NAME}

# Set default user.
ENV HOME /home/devuser
USER devuser

CMD /bin/bash
