# source https://dev.to/rogertorres/first-steps-with-docker-rust-30oi

FROM rust:latest as build

# Create a project
RUN USER=root cargo new --bin app
WORKDIR /app

# Copy the configuration file
COPY ./app/Cargo.lock ./Cargo.lock
COPY ./app/Cargo.toml ./Cargo.toml

# Cache only dependencies
RUN cargo build --release
RUN rm src/*.rs

# Copy source from Host
COPY ./app/src ./src

# Build for release
RUN rm ./target/release/deps/app*
RUN cargo build --release

FROM debian:buster-slim

# Use an external image as a "stage"
COPY --from=build /app/target/release/app /usr/src/app

# Run binary
CMD ["/usr/src/app"]
