Franchise = require './franchise'
units = require './units' # buildings

class User
    franchise = null
    currentBuilding = {} #
    botrons = []
    constructor: (@name) ->
        # load user settings
        #
        # if no user settings (new game)
        @franchise = new Franchise.Franchise("#{@name} place")
        @franchise.setBlueprint units.buildings['building/shed']
        #@unit = new Unit.Unit('shed')
        #console.log @franchise

    save: () ->
        # save user and franchise to user file
        #
    load: (user) ->
        #load user and franchise from user file


module.exports.User = User
