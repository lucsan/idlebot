# Franchise holds all player assets
units = require './units' # building blueprints
Building = require './building'

class Franchise
    buildings = []
    currentBuilding = 0
    constructor: (@name) ->
        @buildings = []
        currentBuilding = 0

    setBlueprint: (blueprint) =>
        @buildings.push new Building.Building(blueprint)
        console.log 'bay capacity ',@buildings[currentBuilding].getRechargeBayCapacity()


module.exports.Franchise = Franchise
