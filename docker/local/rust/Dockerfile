FROM rust:latest as builder

WORKDIR /usr/src/app
COPY ./app .

# Install Cargo Extensions & Web Framework
RUN cargo install cargo-watch cargo-edit

# run on startup
COPY ./docker/local/rust/startup.sh /startup.sh

# Hot Reload
CMD ["/startup.sh"]
