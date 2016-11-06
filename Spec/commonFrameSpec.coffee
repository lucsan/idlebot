# jasmine-node --coffee commonFrameSpec.coffee
#
BotBits = require '.././commonFrame'
Botron = require '.././botron'
parts = require '../Data/./parts'
resources = require '../Data/./resources'

botron = new Botron('Test Bot')
process.logger = {
    info: (msg) ->
    error: (msg) ->
    }

describe "commonFrame", ->
    it "loads a frame into a bot", ->
        BotBits.loadFrame botron, parts.frames['parts/frames/basic']
        expect(botron.frame).toEqual parts.frames['parts/frames/basic']

    it "Has a frame module capacity", ->
        expect(botron.frame.max['sensors']).toEqual 2

    it "loads parts into bot frames", ->
        BotBits.loadPart botron, parts.modules['parts/modules/sensors/sight/basic']
        expect(botron.frame.parts.length).toEqual 1
        expect(botron.frame.parts[0]).toEqual parts.modules['parts/modules/sensors/sight/basic']

    it "has a maximum capcaity for a part", ->
        BotBits.loadPart botron, parts.modules['parts/modules/sensors/sight/basic']
        BotBits.loadPart botron, parts.modules['parts/modules/sensors/sight/basic']
        expect(botron.frame.parts.length).toEqual 2

    it "Can hold a variety of parts", ->
        #loadPart
        BotBits.loadPart botron, parts.modules['parts/modules/armatures/grabber']
        BotBits.loadPart botron, parts.modules['parts/modules/hopper/basic/general']
        expect(botron.frame.parts.length).toEqual 4


    it "Can remove parts", ->
        #removePart
        BotBits.removePart botron, 'parts/modules/sensors/sight/basic'
        expect(botron.frame.parts.length).toEqual 3

    it "Can list parts it contains", ->
        #list
        list = BotBits.listParts botron
        expect(list[1].gene).toEqual 'grabber'

    it "Can load resources into a hopper, if it has a suitable hopper", ->
        #loadHopper
        res = [
            {
            name: 'grass',
            scan: { vision: 0.8, radar: 0.4 },
            make: 'raws/fiber',
            tools: { grabber: 0.4, scyth: 0.6, mower: 0.8 },
            bulk: 1,
            scanChance: 0.8,
            harvestAmount: 0.4 },
            { name: 'pebble',
            scan: { vision: 0.8, radar: 0.4 },
            make: 'raws/stone',
            tools: { grabber: 0.5 },
            bulk: 1,
            scanChance: 0.8,
            harvestAmount: 0.5 }
        ]
        BotBits.loadHopper botron, res
        expect(botron.frame.parts['']).toEqual true


    # it "contains functions", ->
    #     #expect(true).toBe(true)
    #     expect(BotBits.loadPart).toEqual(true)
    #
    # it "botbits", ->
    #     console.log BotBits






# describe("A suite", function() {
#   it("contains spec with an expectation", function() {
#     expect(true).toBe(true);
#   });
# });
