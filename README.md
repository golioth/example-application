
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/from-referrer/)

----

# Zephyr Example Application

This repository contains a Zephyr example application. The main purpose of this
repository is to serve as a reference on how to structure Zephyr based
applications. Some of the features demonstrated in this example are:

- Basic application skeleton
- [Custom boards][board_porting]
- Custom [devicetree bindings][bindings]
- Out-of-tree [drivers][drivers]
- Example CI configuration (using Github Actions)


[board_porting]: https://docs.zephyrproject.org/latest/guides/porting/board_porting.html
[bindings]: https://docs.zephyrproject.org/latest/guides/dts/bindings.html
[drivers]: https://docs.zephyrproject.org/latest/reference/drivers/index.html
[zephyr]: https://github.com/zephyrproject-rtos/zephyr

<br>

# Getting Started

We reccomend using the provided gitpod workspace template to get started. (Click the button at the top of this readme) Unless of course you are the type of masochist who likes to build houses made from cards.

<br>

# Initialization

The first step is to initialize the workspace folder (``my-workspace``) where
the ``example-application`` and all Zephyr modules will be cloned. You can do
that by running:

```shell
# initialize my-workspace for the example-application (main branch)
west init -m https://github.com/zephyrproject-rtos/example-application --mr main my-workspace
# update Zephyr modules
cd my-workspace
west update
```

<br>

# Build & Run

The application can be built by running:

```shell
west build -b $BOARD -s app
```

where `$BOARD` is the target board. The `custom_plank` board found in this
repository can be used. Note that Zephyr sample boards may be used if an
appropriate overlay is provided (see `app/boards`).

A sample debug configuration is also provided. You can apply it by running:

```shell
west build -b $BOARD -s app -- -DOVERLAY_CONFIG=debug.conf
```

Note that you may also use it together with `rtt.conf` if using Segger RTT. Once
you have built the application you can flash it by running:

```shell
west flash
```
