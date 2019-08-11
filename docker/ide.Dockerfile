FROM codercom/code-server:1.1156-vsc1.33.1

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN sudo ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime

RUN sudo apt update && sudo apt install -y php php-xdebug

RUN code-server --install-extension=felixfbecker.php-debug