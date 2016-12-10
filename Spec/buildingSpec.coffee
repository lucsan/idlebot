fs = require 'fs'
common = require '.././common'
structures = require '.././Data/structures' # buildings
buildings = require '.././buildings'

describe "building", ->
    compound = {}
    shed = {}

    beforeEach ->
        compound = new buildings.Compound
        shed = new buildings.Building structures.buildings['structures/buildings/shed/command']

    it "is defined by structure.buildings", ->
        expect(shed.name).toEqual 'command shed'

    it "is contained in a compound", ->
        buildings.addBuildingToCompound compound, shed
        expect(compound.buildings[compound.currentBuilding].code).toEqual 'structures/buildings/shed/command'

    it "can be found in a compound by its code", ->
        buildings.addBuildingToCompound compound, shed
        list = buildings.findBuildingsInCompound compound, 'structures/buildings/shed/command'
        expect(list.length).toEqual 1

    it "can contain bays", ->
        bay = new buildings.Bay structures.bays['structures/shed/bay/recharge']
        buildings.addBayToBuilding shed, bay
        expect(shed.bays[0].code).toEqual 'structures/shed/bay/recharge'

    it "has a maximum of bays it can contain", ->
        bay = new buildings.Bay structures.bays['structures/shed/bay/storage']
        buildings.addBayToBuilding shed, bay
        for number in [1..5]
            bay = new buildings.Bay structures.bays['structures/shed/bay/recharge']
            buildings.addBayToBuilding shed, bay
        bay = new buildings.Bay structures.bays['structures/shed/bay/storage']
        buildings.addBayToBuilding shed, bay
        for number in [1..5]
            bay = new buildings.Bay structures.bays['structures/shed/bay/recharge']
            buildings.addBayToBuilding shed, bay
        expect(shed.bays.length).toEqual shed.max.bays

    it "can find bays according to their codes", ->
        stores = buildings.findBays shed, 'structures/shed/bay/storage'
        expect(stores.length).toEqual 2
