fs = require 'fs'
common = require '.././common'
structures = require '.././Data/structures' # buildings
buildings = require '.././buildings'

describe "building", ->
    compound = {}
    shed = {}

    beforeEach ->
        compound = new buildings.Compound
        shed = new common.Plan structures.buildings['shed/command']

    it "is defined by structure.buildings", ->
        expect(shed.name).toEqual 'command shed'

    it "is contained in a compound", ->
        buildings.addBuildingToCompound compound, shed
        expect(compound.buildings[compound.currentBuilding].code).toEqual 'shed/command'

    it "can be found in a compound by its code", ->
        buildings.addBuildingToCompound compound, shed
        list = buildings.findBuildingsInCompound compound, 'shed/command'
        expect(list.length).toEqual 1

    it "can contain bays", ->
        bay = new common.Plan structures.bays['recharge']
        buildings.addBayToBuilding shed, bay
        expect(shed.bays[0].code).toEqual 'recharge'

    it "has a maximum of bays it can contain", ->
        bay = new common.Plan structures.bays['storage']
        buildings.addBayToBuilding shed, bay
        for number in [1..5]
            bay = new common.Plan structures.bays['recharge']
            buildings.addBayToBuilding shed, bay
        bay = new common.Plan structures.bays['storage']
        buildings.addBayToBuilding shed, bay
        for number in [1..5]
            bay = new common.Plan structures.bays['recharge']
            buildings.addBayToBuilding shed, bay
        expect(shed.bays.length).toEqual shed.max.bays

    it "can find bays according to their codes", ->
        stores = buildings.findBays shed, 'storage'
        expect(stores.length).toEqual 2
