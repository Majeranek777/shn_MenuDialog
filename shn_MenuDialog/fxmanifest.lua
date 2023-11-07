fx_version 'cerulean'
game 'gta5'

ui_page('html/index.html')

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/jquery.min.js',
}

exports{
    'QuestEnter',
    'QuestExit'
}

client_scripts {
    "deferred.lua",
    "client.lua",
    "quests/*"
}