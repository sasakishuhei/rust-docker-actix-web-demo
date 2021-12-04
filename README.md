# Demonstration of Rust and Actix-Web in Docker

Demonstration of Rust and Actix-Web in docker.（※WIP）

## Prerequisites

Before you begin, ensure you have met the following requirements:

* You have a Mac machine.
* You have installed docker, rust, vscode etc...

## Installing "Demonstration of Rust and Actix-Web in Docker"

```
git clone https://github.com/sasakishuhei/rust-docker-demo.git
```

## Using "Demonstration of Rust and Actix-Web in Docker"

To use "Demonstration of Rust and Actix-Web in Docker", follow these steps:

1. Install the "rust-analyzer" vscode extension.

```
adminnoMacBook-puro-5:rust-docker-actix-web-demo shuheisasaki$ ./install_extentions_on_vscode.sh
Installing extensions...
Installing extension 'matklad.rust-analyzer'...
(node:1721) [DEP0005] DeprecationWarning: Buffer() is deprecated due to security and usability issues. Please use the Buffer.alloc(), Buffer.allocUnsafe(), or Buffer.from() methods instead.
(Use `Electron --trace-deprecation ...` to show where the warning was created)
Extension 'matklad.rust-analyzer' v0.2.834 was successfully installed.
```

If you want to add more extensions, please modify as the following file.

install_rust_extentions_on_vscode.sh

```
#!/bin/bash

extensions=(
    "matklad.rust-analyzer"
    "hogehoge"
    "foo"
    ...
)

command="code"
for extension in "${extensions[@]}"; do
    command="$command --install-extension $extension"
done
eval $command
```

2. Start container.

```
adminnoMacBook-puro-5:rust-docker-actix-web-demo shuheisasaki$ make up
...
Status: Downloaded newer image for postgres:latest
Creating rust-docker-actix-web-demo_db_1  ... done
Creating rust-docker-actix-web-demo_app_1 ... done
```

3. Check logs and to access localhost.

logs

```
adminnoMacBook-puro-5:rust-docker-actix-web-demo shuheisasaki$ make logs
docker logs rust-docker-actix-web-demo_app_1 -f
...
ternal-7d7b3dc382841144.so'
    Finished dev [unoptimized + debuginfo] target(s) in 4.29s
     Running `target/debug/app`
```

request and response

```
adminnoMacBook-puro-5:rust-docker-actix-web-demo shuheisasaki$ curl http://localhost:3001/
Hello world!
```




