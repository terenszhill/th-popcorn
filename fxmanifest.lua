fx_version 'cerulean'

game 'gta5'

author 'terenszhill'

description 'popcorn maker script for qbcore'

version '0.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'en.lua',
}

server_script 'server.lua'

client_script 'client.lua'

lua54 'yes'