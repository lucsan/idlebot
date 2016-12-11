# Provides buildings Classes
# @blueprint is an object from structures.coffee
# ie: structures.buildings['structures/buildings/shed/command']

class Compound
    name = ''
    buildings = []
    currentBuilding = null
    constructor: () ->
        @buildings = []
        @currentBuilding = null
        @name = ''

class Building
    constructor: (@blueprint) ->
        for item, value of @blueprint
            @[item] = value
        #@name = common.makeName()

class Bay
    constructor: (@blueprint) ->
        for item, value of @blueprint
            @[item] = value

module.exports.addBuildingToCompound = (compound, building) =>
    compound.buildings.push building
    compound.currentBuilding = compound.buildings.length - 1

module.exports.findBuildingsInCompound = (compound, code) =>
    list = []
    for building in compound.buildings
        list.push building if building.code == code
    return list


module.exports.addBayToBuilding = (building, bay) =>
    building.bays.push bay if checkBuildingCapacity(building)

checkBuildingCapacity = (building) =>
    return true if building.max.bays > building.bays.length
    false

module.exports.findBays = (building, code) =>
    a = []
    for i, b of building.bays
        a.push b if b.code == code
    return a




# Using this method (classes and functions in same file, imported with requires), classes must be exported
# here. module.exports = class ClassName 
module.exports.Compound = Compound
module.exports.Building = Building
module.exports.Bay = Bay
