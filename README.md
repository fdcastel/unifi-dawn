# unifi-dawn

Run custom scripts on Unifi OS Startup.



# How to install

1. Run:

    ⚠️ Please review the [installer source code](https://github.com/fdcastel/unifi-dawn/blob/master/install.sh) before running it on your system. ⚠️

    ```bash
    wget -O - https://raw.githubusercontent.com/fdcastel/unifi-dawn/master/install.sh | bash
    ```

2. Put your scripts in `/data/unifi-dawn.d/` directory. 

    - Each script MUST _start with a [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))_ or the initialization will fail. 
    - Also, remember to `chmod +x` them. Non-executable files _will be ignored_.




# Usage

On Unifi OS startup, _as soon as the network becomes available_, the scripts from `/data/unifi-dawn.d/` will be executed _in alphabetical order_.

- To check the service status:

    ```bash
    systemctl status unifi-dawn
    ```

- To see the scripts output (logs):

    ```bash
    journalctl -u unifi-dawn
    ```



# Sample script

```bash
SCRIPT_FILE=/data/unifi-dawn.d/10-test-download.sh
cat > $SCRIPT_FILE <<EOF
#!/bin/bash

wget -4 -O /tmp/temp.sh https://raw.githubusercontent.com/fdcastel/unifi-dawn/master/install.sh
EOF
chmod +x $SCRIPT_FILE
```



# To uninstall

```bash
# Remove service link (uninstall service)
systemctl disable unifi-dawn.service

# Remove script file
rm /etc/systemd/system/unifi-dawn.service
```



# Reference

- [`systemd` Services - Basic usage](https://wiki.debian.org/systemd/Services)
- [`systemd.unit` - Unit configuration (bullseye)](https://manpages.debian.org/bullseye/systemd/systemd.unit.5.en.html)
- [`systemd.service` - Service unit configuration (bullseye)](https://manpages.debian.org/bullseye/systemd/systemd.service.5.en.html)
