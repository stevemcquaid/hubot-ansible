# hubot
Deploy scripts for Hubot. On your local folder you will have a hubot_env.config file containing environmental vars which is excluded from source control.  Ansible will rebuild the file on the remote host.

# Updating Hubot
To update the bot, simply run: `cd deploy && bash -x update.sh`

# Manually run Hubot
    * `source hubot_env.config`
    * `export HUBOT_LOG_LEVEL="debug"`
    * `./bin/hubot --adapter slack`

# Manually restart Hubot
    * `sudo systemctl restart hubot.service`

# Monitor Hubot`
    * `journalctl -feu hubot.service`

# How to manually bootstrap a new VM for the bot
    * Need to install nodejs, redis, npm
    * Need to npm install coffee-script
    * Need to enable and start services + more.
    * Create hubot_env.config
        * `touch /etc/sysconfig/hubot_env.config`
    * Create systemd service file here: `/etc/systemd/system/hubot.service`
        * `touch /etc/systemd/system/hubot.service`
    * Reload Systemd
        * `systemctl daemon-reload`
    * Make sure hubot.service is persistant across reboots
        * `chkconfig hubot.service`
        * `systemctl enable hubot.service`
    * Start the service
        * `systemctl start hubot.service`
    * Setup cron file here: `/etc/cron.d/hubot-restart`
        * `echo 'MAILTO=""' > /etc/cron.d/hubot-restart`
        * `echo '0 * * * * root systemctl restart hubot.service >> /home/<USER>/crons.log' >> /etc/cron.d/hubot-restart`
    * Set cron file permissions
        * `chmod 755 /home/<USER>/hubot-slack-deploy/restart.sh`

# TODO
    * Create var in ansible which will modify the channel Hubot monitors
    * Allow running ansible by user without `hubot_env.config`. Persist old ones if not provided