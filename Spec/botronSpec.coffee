fs = require 'fs'
parts = require '.././Data/parts'
resources = require '.././Data/resources'
botron = require '.././botron'
common = require '.././common'

describe "botron", ->
    bot = {};

    beforeEach ->
        bot = common.newPlan parts.botrons['parts/botron']


    afterEach ->

    it "has a parts blueprint", ->
        blueprint = parts.botrons['parts/botron']
        expect(blueprint.code).toEqual 'parts/botron'

    it "can be constructed as a plan from its blueprint", ->
        expect(bot.code).toEqual 'parts/botron'

    it "can have a name assigned to it", ->
        bot.name = 'TestBobo'
        expect(bot.name).toEqual 'TestBobo'

    it "can have a frame loaded into it", ->
        frame = common.newPlan parts.frames['parts/frames/basic']
        botron.loadFrame bot, frame
        expect(bot.frame.code).toEqual 'parts/frames/basic'

    it "can have equipment module loaded into its frame", ->
        botron.loadFrame bot, common.newPlan parts.frames['parts/frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        expect(bot.frame.modules[0].code).toEqual 'parts/modules/sensors/sight/basic'

    it "has a module type limit", ->
        botron.loadFrame bot, common.newPlan parts.frames['parts/frames/basic']
        expect(bot.frame.max.sensors).toEqual 2

    it "can only hold a specifed number of a particular type of module", ->
        botron.loadFrame bot, common.newPlan parts.frames['parts/frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        expect(bot.frame.modules.length).toEqual bot.frame.max.sensors

    it "can not do a scan if it has not a sensor", ->
        botron.loadFrame bot, common.newPlan parts.frames['parts/modules/armatures/grabber']
        Scanedesources = botron.scan bot, resources.raws
        expect(Scanedesources.length).toEqual 0

    it "can do a scan if it has a sensor", ->
        botron.loadFrame bot, common.newPlan parts.frames['parts/frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['parts/modules/sensors/sight/basic']
        scanedResources = botron.scan bot, resources.raws
        expect(scanedResources.length).toBeGreaterThan 0
