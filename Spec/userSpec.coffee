fs = require 'fs'
user = require '.././user'
botron = require '.././botron'
#frame = require '.././frame'


describe "A user", ->
    player = {}
    srobo = {}

    #player = {}
    beforeEach ->
        player = new user 'TestBob'
        srobo = new botron 'TestUserRobo'
        #player = new user('TestBob')

    it "Is a player object", ->
        expect(player.botrons.length).toEqual 0

    it "Has a save method", ->
        user.save player
        expect(fs.existsSync 'Users/' + player.name + '.user').toEqual true

    it "Has a file load method", ->
        playerFile = user.load player.name
        playerData = JSON.parse playerFile
        expect(playerData.name).toEqual('TestBob')

    it "Has a delete method", ->
        user.delete player
        expect(fs.existsSync 'Users/' + player.name + '.user').toEqual false

    it "can save player botron data", ->
        player.botrons.push srobo
        user.save player
        playerFile = user.load player.name
        playerData = JSON.parse playerFile
        expect(playerData.botrons.length).toEqual 1

    it "can load playerData into a user object", ->
        playerBob = new user 'TestBob'
        playerFile = user.load player.name
        playerData = JSON.parse playerFile
        user.loadDataIntoPlayer player, playerData
        expect(player.botrons.length).toEqual 1




    it "can save a player botron with modules", ->
        #expect(player.botron.length).toEqual 1

        #console.log playerData



#console.log srobo
#console.log player
    #console.log playerFile
