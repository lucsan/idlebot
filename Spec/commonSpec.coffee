fs = require 'fs'
common = require '.././common'
structures = require '.././Data/structures' # compounds buildings and bays.
parts = require '.././Data/parts'
buildings = require '.././buildings'

describe "common include", ->

    beforeEach ->

    it "has a plan object for blueprints", ->
        blueprint = structures.buildings['structures/buildings/shed/basic']
        plan = new common.Plan blueprint
        expect(plan.code.length).toBeGreaterThan 0

    it "can take a variety of blueprints", ->
        blueprint = parts.frames['parts/frames/basic']
        frame = new common.Plan blueprint
        expect(frame.code.length).toBeGreaterThan 0

    it "auto generates a name for itself if it dosent have one", ->
        blueprint = parts.frames['parts/frames/basic']
        frame = new common.Plan blueprint
        expect(frame.name).toEqual 'basic frame'

        blueprint = structures.bays['structures/shed/bay/recharge']
        bay = new common.Plan blueprint
        expect(bay.name.length).toEqual 6

    it "has a makeName which can be called independently of plan", ->
        name = common.makeName(4)
        expect(name.length).toEqual 12





#     it "has this experiment", ->
#         compound = new buildings.Compound
#         blueprint = structures.buildings['structures/buildings/shed/basic']
#         addBuildingToCompound compound, blueprint
#         building = compound.buildings[0]
#
#         blueprint = structures.bays['structures/shed/bay/recharge']
#         compound.buildings[0].bays.push blueprint
#         #console.log building
#
#         a = new common.Plan structures.bays['structures/shed/bay/recharge']
#         b = new common.Plan structures.bays['structures/shed/bay/recharge']
#
#         a.type = 'barry'
#         console.log a
#         console.log b
#         #addBayToBuilding building
#
#
# addBayToBuilding = (building, bay) =>
#     building.bays.push bay
#
# addBuildingToCompound = (compound, building) =>
#     compound.buildings.push building
#     compound.currentBuilding = compound.buildings.length - 1
