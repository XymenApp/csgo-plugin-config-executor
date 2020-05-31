#include <sourcemod>
#define AUTHOR "XymenApps"
#define TAG "-=XymenGaming=-"
#define PLUGIN_VERSION "1.1"


ConVar g_ConfigCvar;

public Plugin myinfo = 
{
	name = "[SM] Config Executor",
	author = AUTHOR,
	description = "Config Executer for CSGO Servers",
	version = PLUGIN_VERSION,
	url = "https://github.com/XymenApp/csgo-plugin-config-executor/"
}

public OnPluginStart()
{
	CreateConVar("sm_ce_version", PLUGIN_VERSION, "Show the version of the plugin", FCVAR_SPONLY|FCVAR_NOTIFY|FCVAR_DONTRECORD);
	g_ConfigCvar = CreateConVar("sm_config_executor_file", "xyg_default.cfg", "Config to execute when all the plugins are loaded. File will be executed once in the lifetime of plugin");
	RegAdminCmd("sm_ce_execute", CmdReExecute, ADMFLAG_GENERIC, "Execute the config files insile the folder");
	PrintToServer("Plugin made with love by %s", AUTHOR);
	AutoExecConfig(true, "config_executor", "sourcemod");
}

public void OnClientConnected(int client){
	PluginMain(client);
}

public void PluginMain(int client){
	PrintToServer("XYG Client Number: %d", client);
	if(client == 1){
		ExecCfg(g_ConfigCvar);
	}else{
		PrintToServer("----------------XYG-----------------Aborting");
	}
}

public bool ExecCfg(ConVar cvar)
{
	char cfg[PLATFORM_MAX_PATH];
  	cvar.GetString(cfg, sizeof(cfg));
	ServerCommand("exec \"%s\"", cfg);
	return true;
}

public Action CmdReExecute(client, args)
{
	if(ExecCfg(g_ConfigCvar))
	{
		PrintToChat(client, "[%s] Server Configs have been executed!", TAG);
	}
	else
	{
		PrintToChat(client, "[%s] An error ocurred while executing the configs!", TAG);
	}
	return Plugin_Handled;
}
