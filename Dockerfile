FROM rust:latest
WORKDIR /app
COPY . .
RUN cargo install diesel_cli --no-default-features --features postgres
RUN cargo install cargo-watch
RUN apt update
RUN apt install -y curl build-essential python3 nano make gcc pkg-config libx11-dev libxkbfile-dev libsecret-1-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt -y install nodejs
RUN npm install -g yarn
RUN yarn
ENTRYPOINT ["yarn", "theia", "start", "/home", "--hostname", "0.0.0.0", "--port", "8080", "--plugins=local-dir:plugins"]