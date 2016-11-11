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
        @name = common.makeName()

class Bay
    constructor: (@blueprint) ->
        for item, value of @blueprint
            @[item] = value

module.exports.setBuilding = (compound, building) =>
    compound.buildings.push building
    compound.currentBuilding = compound.buildings.length

module.exports.setBay = (compound, buildingCode, bay) =>
    for i, b of compound.buildings
        if b.code == buildingCode
            compound.buildings[i].bays.push bay if checkBuildingCapacity(b)

checkBuildingCapacity = (building) =>
    return true if building.max.bays > building.bays.length
    false

module.exports.findBays = (building, code) =>
    a = []
    for i, b of building.bays
        a.push b if b.code == code
    return a




# Using this method (classes and functions in same file, imported with requires), classes must be exported
# here. module.exports = class ClassName only works for 1 class per file
module.exports.Compound = Compound
module.exports.Building = Building
module.exports.Bay = Bay

# module.exports = class Building
#     location = ''
#     bays = {}
#     constructor: (@blueprint) ->
#         @bays = {}
#
#     setBay: (bay) =>
#         @bays blueprint if !@bays[blueprint]
        # rechargeBay = {}
        # storageBay = {}
        # loadingDock = {}
        # equipmentBay = {}

    # getRechargeBayCapacity: () =>
    #     @blueprint.rechargeBay
    #
    # getStorageBayCapacity: () =>
    #     @blueprint.storageBay
