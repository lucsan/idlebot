module.exports = class User
    compounds = []
    currentBuilding = {}
    botrons = []
    constructor: (@name) ->
        @botrons = []
        @compounds = []

        # load user settings
        # if no user settings (new game)

    check: =>
        # has user file
        # has franchise
        # count botrons
    save: =>
        # save user and franchise to user file
        fs = require 'fs'
        fs.writeFileSync 'Users/' + @name + '.user', JSON.stringify this

    load: (name, buildings, botron) =>
        #load user and franchise from user file
        fs = require 'fs'
        if !fs.existsSync 'Users/' + name + '.user'
            @newPlayer name, buildings, botron

        playerData = fs.readFileSync 'Users/' + name + '.user', 'utf8'
        playerData = JSON.parse playerData
        console.log playerData
        # @name = playerData.name
        # for i, robo in playerData.botrons
        #     @botrons.push robo
        # @franchise = playerData.franchise

    # newPlayer: (name, buildings, botron) =>
    #     parts = require './Data/parts'
    #     structures = require './Data/structures'
    #     @name = name
    #     buildings.setBuilding structures.buildings['structures/buildings/shed']
    #     buildings.setBay 'structures/buildings/shed', 'structures/shed/bay/storage'
    #     @compounds = franchise
    #     botron.addFrame parts.frames['parts/frames/basic']
    #     @botrons.push botron
        #
        # @save()
