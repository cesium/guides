---
title: CAOS installation guide
description: A guide to installing the required software to contribute to CAOS
---

A guide to installing the required software to contribute to CAOS

---

## Installing via the provided script

We have a script that installs the basic software for you. In order to install software via that script, download it using

```bash
wget https://docs.cesium.link/scripts/installation.sh
chmod +x installation.sh
./installation.sh
rm installation.sh
```

Note you will be prompted for your `sudo` password. If the script executed successfully, then you are done for the most part. You may want to install optional software, which we will also cover in this guide.

## Manual Installation

If the script failed to execute for some reason, or you want to install everything yourself, this following section will explain how to do it.

### ASDF Version Manager

ASDF is a version manager that allows us to have multiple versions of our tools (i.e. NodeJS, Elixir and Erlang) installed in our machine. This allows us to run each project with a specific version of our tools, which is essential in ensuring consistency between the different development environments. A mismatch in versions can create / hide bugs that would manifest later, for example, in production.

To install ASDF, (refer to the official documentation)[https://asdf-vm.com/guide/getting-started.html].

Once it is installed, install the needed plugins.

```bash
asdf plugin add nodejs
asdf plugin add elixir
asdf plugin add erlang
```

### Docker

Docker is a tool that allows us to run our applications in (containers)[https://en.wikipedia.org/wiki/Containerization_(computing)]. Again, this allows us to have a development environment that is really close to the production one, reducing the risk of hiding / creating bugs that would only happen on one environment.

To install Docker do the following:

| OS | Command |
| Arch Linux | sudo pacman -S docker docker-compose |
| Fedora | [Refer to this guide](https://docs.docker.com/engine/install/fedora) |
| Ubuntu | [Refer to this guide](https://docs.docker.com/engine/install/ubuntu) |
| macOS | brew install docker && brew install docker-compose|

## Optional Software

### Web Browsers

If you are doing frontend / full stack work, it is recommended to have at least two browsers installed: Chrome/Chromium and Firefox. This is because these two use different [browser engines](https://en.wikipedia.org/wiki/Comparison_of_browser_engines), i.e., the software that renders the HTML is different, and can lead to different behaviour in different browsers. Therefore, having multiple browsers with different engines installed allows you to test your code better and helps find bugs sooner rather than later in the development process.

#### CORS Everywhere

Sometimes when testing with remote API (i.e. API not running on your local machine), you may encounter problems with [CORS](https://developer.mozilla.org/pt-BR/docs/Web/HTTP/CORS). To fix this in development (read, this is not a solution for production), install the [CORS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/cors-everywhere/) browser extension or [similar](https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf) in your browser. This allows you to temporarily bypass all CORS restriction (and should not be enabled when not developing for security reasons).

### Postman

[Postman](https://www.postman.com) is a program that allows you to test different API endpoints by directly querying the API via HTTP instead of having to program the requests yourself. It is very useful in testing backend projects - safira, bokken, e.g. -, but also in frontend development when integrating with an API.

You can download Postman using the following commands:

| OS | Command |
|-|-|
| Arch based | yay -S postman-bin |
| Ubuntu / Debian based | sudo snap install postman |
| Fedora / Red Hat | [Refer to this tutorial](https://mamchenkov.net/wordpress/2020/01/30/install-postman-on-fedora-31/) |
| macOS | brew install --cask postman |

If you are on Ubuntu and don't want to use snap, you can follow [this guide](https://www.how2shout.com/linux/how-to-install-postman-on-ubuntu-20-04-lts-linux/).

### DBeaver

DBeaver is a tool that helps you visualize and manage your databases. It can be really useful when doing backend / DevOps, especially when you need to perform queries on a database but don't want to write SQL.

To install it, run the following command:

| OS | Command |
| - | - |
| Arch Linux | yay -S dbeaver |
| Ubuntu / Fedora / macOS | [Refer to the instructions here](https://dbeaver.io/download) |

### Heroku CLI

This is only useful if you are doing DevOps for an event. Heroku is the PaaS platform of our choice for hosting the platforms of all our major events. The CLI is a convenient way to interact with it via the terminal. If you are in a position such that this piece of software will be useful to you, I believe you are able to install it yourself.
