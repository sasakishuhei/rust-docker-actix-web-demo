#!/bin/bash

# Install Framework
cargo add actix-web@"3.3.2" --dev

# Watch "run" Command
cargo watch -x run
