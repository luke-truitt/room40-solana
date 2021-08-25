FROM rust:1.54

WORKDIR /usr/src/room40sol
COPY . .
COPY room40-stage-75d2b4a2f183.json /usr/src/soliroom40solstener/room40-stage-75d2b4a2f183.json

RUN apt-get update && apt-get install -y libudev-dev && rm -rf /var/lib/apt/lists/*

RUN cargo install --path .

ENV GOOGLE_APPLICATION_CREDENTIALS="/usr/src/room40sol/room40-stage-75d2b4a2f183.json"

CMD ["room40sol", "--project", "room40-stage", "--dataset", "solana"]
