# Config Executer for CSGO Servers
Execute different config files for different server with same game installation files at startup. 

Some plugins need to be disabled when in particular game mode. You can turn them off, provided the plugin has convar like `sm_pugsetup_enabled`, by setting the value to `0`  

# Installation
Download [latest](https://github.com/XymenApp/csgo-plugin-config-executor/releases/latest) build from [Releases](https://github.com/XymenApp/csgo-plugin-config-executor/releases) page and copy-paste. THAT'S IT.

# Config File
`csgo/addons/sourcemod/configs/xyg_ce.cfg`

# Convars
- `sm_ce_version` : Show the version of the plugin

# Admin Commands
- `sm_ce_execute` : Reexecute the config files and print message to chat

# Why this plugin?
You can anytime put `exec another_config_file` and execute your commands at startup with `server.cfg` but you cannot configure the sourcemod plugins at this moment. To overcome this issue, this plugin loads your config files when all the plugins setup is complete.