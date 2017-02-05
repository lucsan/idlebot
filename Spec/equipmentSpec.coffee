fs = require 'fs'
common = require '.././common'
structures = require '.././Data/structures' # compounds buildings and bays.
parts = require '.././Data/parts'
buildings = require '.././buildings'

describe "Equipment include", ->

    bot = {};

    beforeEach ->
        bot = common.newPlan parts.botrons['botron']

    afterEach ->

    it "has stuff", =>
        expect(bot.code).toEqual 'botron'


    it "has code", =>
