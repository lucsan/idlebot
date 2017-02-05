fs = require 'fs'
common = require '.././common'
structures = require '.././Data/structures' # compounds buildings and bays.
parts = require '.././Data/parts'
equipment = require '.././Data/equipment'
resources = require '.././Data/resources'

botron = require '.././botron'
buildings = require '.././buildings'

describe "development ideas code", ->

    bot = {}
    refinery = {}

    beforeEach ->
        bot = common.newPlan parts.botrons['botron']
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        refinery = common.newPlan equipment['refinery/basic']
        refinery.name = 'Test Refinery'

    afterEach ->

    it "has stuff", =>
        expect(bot.code).toEqual 'botron'
        #console.log refinery
        raws = resources.raws
        mats = resources.mats
        #console.log mats
        #console.log bot


    it "has code", =>
