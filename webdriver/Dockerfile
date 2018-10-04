FROM debian:sid as driver

RUN apt-get update && apt-get install -y curl unzip

RUN curl -Ls https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-linux64.tar.gz | tar xz -C /usr/local/bin

RUN curl -Ls https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip > /tmp/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver_linux64.zip -d /usr/local/bin

FROM debian:sid

COPY --from=driver /usr/local/bin/geckodriver /usr/local/bin/geckodriver
COPY --from=driver /usr/local/bin/chromedriver /usr/local/bin/chromedriver

RUN set -x \
    && apt-get update \
    && apt-get install -y wget gnupg \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && apt-get purge -y --auto-remove wget gnupg

RUN apt-get update && apt-get install -y firefox=62.0.3-1 google-chrome-stable=69.0.3497.100-1 xvfb=2:1.20.1-4
