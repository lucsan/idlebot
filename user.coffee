module.exports = class User
    name = ''
    compounds = []
    currentBuilding = {}
    botrons = []
    constructor: (@name) ->
        @botrons = []
        @compounds = []

module.exports.save = (user) =>
    # save user and franchise to user file
    fs = require 'fs'
    fs.writeFileSync 'Users/' + user.name + '.user', JSON.stringify user

module.exports.delete = (user) =>
    fs = require 'fs'
    fs.unlinkSync 'Users/' + user.name + '.user'

module.exports.load = (name) =>
    #load user and franchise from user file
    fs = require 'fs'
    if fs.existsSync 'Users/' + name + '.user'
        playerFile = fs.readFileSync 'Users/' + name + '.user', 'utf8'

module.exports.loadDataIntoPlayer = (user, playerData) =>
    user.botrons = playerData.botrons
