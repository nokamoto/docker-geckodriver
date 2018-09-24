FROM debian:sid as driver

RUN apt-get update
RUN apt-get install -y curl

RUN curl -Ls https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-linux64.tar.gz | tar xz -C /usr/local/bin

FROM debian:sid

COPY --from=driver /usr/local/bin/geckodriver /usr/local/bin/geckodriver

RUN apt-get update
RUN apt-get install -y firefox xvfb
