fs = require 'fs'
botron = require '.././botron'
parts = require '.././Data/parts'
common = require '.././common'

describe "botron", ->

    beforeEach ->

    it "has a parts blueprint", ->
        blueprint = parts.botrons['parts/botron']
        expect(blueprint.code).toEqual 'parts/botron'

    it "can be constructed as a plan from its blueprint", ->
        bot = common.newPlan parts.botrons['parts/botron']
        expect(bot.code).toEqual 'parts/botron'

    it "can have a frame loaded into it", ->
        bot = common.newPlan parts.botrons['parts/botron']
        frame = common.newPlan parts.frames['parts/frames/basic']
        botron.loadFrame bot, frame
        expect(bot.frame.code).toEqual 'parts/frames/basic'

    it "can have equipment module loaded into its frame", ->
        bot = common.newPlan parts.botrons['parts/botron']

        botron.loadFrame bot, common.newPlan parts.frames['parts/frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        console.log parts.frames['parts/frames/basic']
        expect(bot.frame.modules[0].code).toEqual 'parts/modules/sensors/sight/basic'

    it "can only hold a specifed number of particular type of module", ->
        bot = common.newPlan parts.botrons['parts/botron']
        console.log parts.frames['parts/frames/basic']
        botron.loadFrame bot, common.newPlan parts.frames['parts/frames/basic']
        #console.log bot
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']


        #expect(bot.frame.modules.length).toEqual 2
