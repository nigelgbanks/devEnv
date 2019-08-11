# Developer Environment for Sky Get Into Tech

Zero setup simple development environment for Sky's "Get into Tech" program which includes:

- Visual Code IDE hosted in the Browser
- PHP 7
- XDebug
- MySQL
- PHPmyAdmin

It has been tested to work on Linux, OSX, and Windows.

## Requirements

Only Docker and Docker compose are required, any recent version will be fine but try to use the latest. 

Follow the specific instuctions for installing the requirements for your operating system in the following sections. 

### Linux Requirements

To install Docker, follow the relevant instructions for your distro:

- [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
- [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
- [Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/)
- [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Other](https://docs.docker.com/install/linux/docker-ce/binaries/)

To install Docker Compose follow the instructions [here](https://docs.docker.com/compose/install/) under the sub-heading "linux".

### OSX Requirements

To install Docker and Docker Compose, follow the relevant instructions [here](https://docs.docker.com/docker-for-mac/install/). You'll want to use "Docker for Mac" if possible. 

If you have an older version of OSX you may have to install "Docker Toolbox", by following the instructions [here](https://docs.docker.com/toolbox/toolbox_install_mac/).

### Windows Requirements

If you have Windows 10 Professional or Enterprise you can install "Docker for Windows", follow the relevant instructions [here](https://docs.docker.com/docker-for-windows/install/). 

If you have an older version of Windows or if you have Windows 10 Home you will have to install "Docker Toolbox", by following the instructions [here](https://docs.docker.com/toolbox/toolbox_install_windows/).

## Gotcha's (Docker ToolBox)

When using "Docker Toolbox" make sure you have the latest version of Virtualbox installed (Instructions [here](https://www.virtualbox.org/wiki/Downloads)), older versions can be a bit flaky when mounting folders.

You **may** have to enable Virtualization in your computers BIOS (though it typically is enabled by default). The instructions for this will vary from machine to machine, what you can do is search for your computers manufacturer plus "how to access BIOS screen". The option you'll want to enabled will be called something like "Enable Intel VT and AMD-V virtualization" or "Enable SVM virtualization" if you have a newer AMD CPU.

There is currently a [bug](https://github.com/docker/machine/issues/4709) in DockerTool box for Windows machines that use newer AMD Ryzen CPU's for which the fix has yet to be released. If this affects you please follow these steps:

- Open Virtualbox and remove the machine "default"
- Open Powershell as Administrator
- Enter the following command `docker-machine rm -f default`
- Create a new machine and ignore the virutalization check `docker-machine create --virtualbox-no-vtx-check -d virtualbox default`

When using Docker Toolbox, you will need to initialize your environment such that it knows which Docker instance it is talking to. Please enter the following command anytime before you start working.

**On Windows (in Powershell):**
```
& "C:\Program Files\Docker Toolbox\docker-machine.exe" env default | Invoke-Expression
```

**On Mac (in Bash):**
```
eval "$(docker-machine env default)"
```

After which point you can do a `docker ps` to test that you are setup correctly.

## Setup and Running the environment

At this point you should have a working Docker installation and have Docker Compose installed as well. Simply enter the following command and you should be up and running.

```
docker-compose up -d
```

To tear down the environment (**without losing changes to Database**):

```
docker-compose down
```

To tear down the environment (**losing all changes to Database**):

```
docker-compose down -v
```

This should host the webserver at `localhost`. If you visit it in your browser it will display a page that links to the Visual Studio Code IDE, and PhpMyAdmin.

If you are using "Docker Toolbox" it **will not** be hosted at `localhost` instead you need to enter the command `docker-machine ip` to get the IP address to visit in your browser.

Now you can edit the source code in the browser via Visual Studio Code, changes will be made to the files in this repository on your harddisk as the folder is mounted by Docker, so they **will not** be lost if you turn off Docker.

You can use the debugger by selecting "Debug > Start Debugging" in Visual Studio Code, then selecting "PHP" if prompted. Then in another tab refresh the index page. The debugger should stop in "index.php".

## Additional Notes

Learning how to use Docker, Docker Compose, etc are beyond the scope of this documentation, but I've collated some useful links below:

Complete Documentation:

- https://docs.docker.com/
- https://docs.docker.com/compose/
- https://docs.docker.com/toolbox/overview/
- https://code.visualstudio.com/docs
- https://git-scm.com/doc

Shorter Tutorials / Articles (Git):

- https://guides.github.com/introduction/git-handbook/
- https://learngitbranching.js.org/

Shorter Tutorials / Articles (Docker):

- https://www.youtube.com/watch?v=pGYAg7TMmp0
- https://www.youtube.com/watch?v=JprTjTViaEA
- https://docker-curriculum.com/