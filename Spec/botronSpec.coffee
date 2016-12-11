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
        blueprint = parts.botrons['parts/botron']
        bot = new common.Plan blueprint
        expect(bot.code).toEqual 'parts/botron'

    it "can have a frame loaded into it", ->
        blueprint = parts.botrons['parts/botron']
        bot = new common.Plan blueprint
        blueprint = parts.frames['parts/frames/basic']
        botron.loadFrame bot, blueprint
        expect(bot.frame.code).toEqual 'parts/frames/basic'

    it "can have equipment module loaded into its frame", ->
        blueprint = parts.botrons['parts/botron']
        bot = new common.Plan blueprint
        blueprint = parts.frames['parts/frames/basic']
        botron.loadFrame bot, blueprint
        blueprint = parts.modules['parts/modules/sensors/sight/basic']

        botron.loadModule bot, blueprint

        console.log blueprint

        expect(bot.frame.modules[0].code).toEqual 'parts/modules/sensors/sight/basic'
