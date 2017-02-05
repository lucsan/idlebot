# jasmine-node --coffee Spec/botronSpec.coffee
fs = require 'fs'
parts = require '.././Data/parts'
resources = require '.././Data/resources'
botron = require '.././botron'
common = require '.././common'

describe "botron", ->
    bot = {};

    beforeEach ->
        bot = common.newPlan parts.botrons['botron']


    afterEach ->


    it "has a parts blueprint", ->
        blueprint = parts.botrons['botron']
        expect(blueprint.code).toEqual 'botron'

    it "can be constructed as a plan from its blueprint", ->
        expect(bot.code).toEqual 'botron'

    it "can have a name assigned to it", ->
        bot.name = 'TestBobo'
        expect(bot.name).toEqual 'TestBobo'

    it "can have a frame loaded into it", ->
        frame = common.newPlan parts.frames['frames/basic']
        botron.loadFrame bot, frame
        expect(bot.frame.code).toEqual 'frames/basic'


    xit "cant have a module loaded as a frame", =>
        botron.loadFrame bot, common.newPlan parts.frames['modules/armatures/grabber']

    it "has a frame specified module type capacity limit", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        expect(bot.frame.max.sensors).toEqual 2

    it "can have equipment module loaded into its frame", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        expect(bot.frame.modules[0].code).toEqual 'modules/sensors/sight/basic'




    # it "can find a module by its code", =>
    #     botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
    #     botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
    #     botron.loadModule bot, common.newPlan parts.modules['modules/armatures/grabber']
    #     botron.loadModule bot, common.newPlan parts.modules['modules/hopper/basic/general']
    #     module = botron.getModule bot, 'modules/armatures/grabber'
    #     console.log module
    #
    #     expect(module.code).toEqual 'modules/armatures/grabber'



        #console.log bot.frame.modules


    it "can only hold a specifed number of a particular type of module", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        expect(bot.frame.modules.length).toEqual bot.frame.max.sensors

    it "can not do a scan if it has not a sensor", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/armatures/grabber']
        ScanedResources = botron.scan bot, resources.raws
        expect(ScanedResources.length).toEqual 0

    it "can do a scan if it has a sensor", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        scanedResources = botron.scan bot, resources.raws
        expect(scanedResources.length).toBeGreaterThan 0

    it "can have a resource harvesting tool", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/armatures/grabber']
        expect(bot.frame.modules[0].code).toEqual 'modules/armatures/grabber'


    it "can not harvest wtihout a harvesting tool", ->


    it "can harvest resources it has scanned if it has a tool", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/armatures/grabber']
        scanedResources = botron.scan bot, resources.raws
        #console.log scanedResources
        foundResources = botron.harvest bot, scanedResources
        expect(foundResources.length).toBeGreaterThan 0
        #console.log foundResources

    it "will harvest resources according to all the tools available", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/armatures/grabber']
        botron.loadModule bot, common.newPlan parts.modules['modules/armatures/mower']

        scanedResources = botron.scan bot, resources.raws
        #console.log scanedResources
        foundResources = botron.harvest bot, scanedResources
        expect(foundResources.length).toBeGreaterThan 0

    it "can have a hopper", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/hoppers/general/basic']
        expect(bot.frame.modules[0].code).toEqual('modules/hoppers/general/basic');

    it "can load its hopper with resources it has found if it has a hopper", ->
        botron.loadFrame bot, common.newPlan parts.frames['frames/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/hoppers/general/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/sensors/sight/basic']
        botron.loadModule bot, common.newPlan parts.modules['modules/armatures/grabber']

        scanedResources = botron.scan bot, resources.raws
        foundResources = botron.harvest bot, scanedResources
        botron.loadHopper bot, foundResources
        expect(bot.frame.modules[0].carrying).toEqual 0.9

        # a = []
        # for code of resources.raws
        #     console.log code
        #     a[code] = code
        # #console.log resources.raws
        # console.log a

        #console.log bot
        #console.log foundResources


    xit "Can tell you about itself (list information)", ->
        info = botron.info bot
        console.log info
