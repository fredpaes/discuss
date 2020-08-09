FROM elixir:1.9.1

WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y inotify-tools build-essential apt-utils \
    && apt-get install -y sudo wget curl zip unzip \
    && curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && mix local.hex --force \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.5.ez --force \
    && mix local.rebar --force

CMD ["mix", "phoenix.server"]
