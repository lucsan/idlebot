buildings = require './buildings'
structures = require './Data/structures' # buildings
#user = require './user'
botron = require './botron'
common = require './common'

fs = require 'fs'

#player = new user()
#
class User
    compounds = []
    currentBuilding = {}
    botrons = []
    newPlayer = null
    constructor: (@name) ->
        @botrons = []
        @compounds = []
        @newPlayer = null

    test: =>
        console.log 'tested'

    save: =>
        # save user and franchise to user file
        fs = require 'fs'
        fs.writeFileSync 'Users/' + @name + '.user', JSON.stringify this

    load: () =>
        #load user and franchise from user file
        fs = require 'fs'
        if !fs.existsSync 'Users/' + @name + '.user'
            @newPlayer = true
            return player
        playerFile = fs.readFileSync 'Users/' + @name + '.user', 'utf8'
        player = JSON.parse playerFile
        @newPlayer = false
        return player

    delete: (name) =>
        fs = require 'fs'
        fs.unlink 'Users/' + @name + '.user'




loadPlayerData = (player, playerData) =>
    if playerData == undefined
        compound = new buildings.Compound
        commandShed = new buildings.Building structures.buildings['structures/buildings/shed/command']
        buildings.setBuilding compound, commandShed

        comm1 = new buildings.Bay structures.bays['structures/shed/bay/command']
        stor1 = new buildings.Bay structures.bays['structures/shed/bay/storage']
        rech1 = new buildings.Bay structures.bays['structures/shed/bay/recharge']
        equp1 = new buildings.Bay structures.bays['structures/shed/bay/equipment']

        buildings.setBay compound, 'structures/buildings/shed/command', comm1
        buildings.setBay compound, 'structures/buildings/shed/command', stor1
        buildings.setBay compound, 'structures/buildings/shed/command', rech1
        buildings.setBay compound, 'structures/buildings/shed/command', equp1

        player.compounds.push compound

        player.save()


    else
        loadPlayerBuildings player, playerData

    return player

loadPlayerBuildings = (player, playerData) =>
    console.log playerData
    for i, c of playerData.compounds
        compound = new buildings.Compound
        compound.buildings = c.buildings
        # for i, b of c.buildings
        #     building = new buildings.Building b
        #     #building.name = b.name
        #     #building.code = b.code
        #     buildings.setBuilding compound, b
        #     for i, y of b.bays
        #         bay = new buildings.Bay
    player.compounds.push compound

    #console.log compound.buildings[0].bays

userName = 'Babo'
#userName = common.makeName()

player = new User userName
player = loadPlayerData(player, player.load())

console.log player
console.log player.compounds[0].buildings
#player.delete()

#     return newPlayer(player) if player.newPlayer == true
#     playerData = player
#     player = new User player.name
#     player.newPlayer = false
#     for i, c of playerData.compounds
#         compound = new buildings.Compound
#         for i, b of c.buildings
#             building = new buildings.Building
#             buildings.setBuilding compound, building
#     player.compounds.push compound
#
#     for i, b of playerData.botrons
#         robo = new botron b.name
#         player.botrons.push robo
#
#
#     console.log  player, '--------', playerData
#     process.exit()
#
# newPlayer = (player) =>
#     player.compounds.push new buildings.Compound
#     commandShed = new buildings.Building structures.buildings['structures/buildings/shed/command']
#     buildings.setBuilding player.compounds[0], commandShed
#
#     player.botrons.push new botron 'robo'
#     player.save()
#     #playerData = JSON.stringify this
#     return player



#player.test()
#player.delete()


#player.load userName, buildings, botron

# if !fs.existsSync 'Users/' + userName + '.user'
#     player = new user userName
#     player.save()
# else
#     player = fs.readFileSync 'Users/' + userName + '.user', 'utf8'



#console.log player.franchise.buildings[0]
#fs.unlink 'Users/' + userName + '.user'

#fran = new franchise 'Bobs Big Bots'

#bob = new user 'Bob', fran
#console.log bob
#bob.save()

#console.log bob.load 'bob'








#console.log player
#(err, data) =>
    # if err
    #     #
    #     #throw err
    #     console.log 'err', err
    # f = data

#console.log f

# get user class and populate with saved user data.

#user = new User.User('baz')

#console.log user
#$franchise = new Franchise.Franchise('baz place')
# start the show

#console.log user.franchise.buildings
