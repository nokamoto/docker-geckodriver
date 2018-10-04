ARG VERSION

FROM nokamoto13/webdriver:${VERSION}

RUN apt-get update && apt-get install -y curl openjdk-8-jdk

RUN curl -Ls https://git.io/sbt > /usr/local/bin/sbt
RUN chmod u+x /usr/local/bin/sbt
