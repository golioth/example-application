FROM zephyrprojectrtos/zephyr-build:v0.19.0

USER root

### Gitpod user ###
# https://community.gitpod.io/t/how-to-resolve-password-issue-in-sudo-mode-for-custom-image/2395
#
# '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# Zephyr SDK
ENV ZEPHYR_SDK_INSTALL_DIR=/opt/toolchains/zephyr-sdk-0.13.1

# Install goliothctl
RUN echo "deb [trusted=yes] https://apt.fury.io/golioth/ /" | tee /etc/apt/sources.list.d/golioth.list
RUN apt update && apt install -y \
    goliothctl \
    coap \
    && rm -rf /var/lib/apt/lists/*