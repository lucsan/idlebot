# jasmine-node --coffee commonFrameSpec.coffee
#
#botFrame = require '.././frame'
botron = require '.././botron'
parts = require '../Data/./parts'
resources = require '../Data/./resources'



process.logger = {
    info: (msg) ->
    error: (msg) ->
    }

describe "frame", ->
    frobo = {}

    beforeEach ->
        frobo = new botron('TestFrameRobo')
        botron.loadFrame frobo, parts.frames['parts/frames/basic']

    it "has no parts", ->
        expect(frobo.frame.parts.length).toEqual 0

    it "Has a frame module capacity", ->
        expect(frobo.frame.max['sensors']).toEqual 2

    it "loads parts into bot frames", ->
        botFrame.loadPart frobo, parts.modules['parts/modules/sensors/sight/basic']
        expect(frobo.frame.parts[0]).toEqual parts.modules['parts/modules/sensors/sight/basic']


    it "has a maximum capcaity for a part", ->
        botFrame.loadPart frobo, parts.modules['parts/modules/sensors/sight/basic']
        botFrame.loadPart frobo, parts.modules['parts/modules/sensors/sight/basic']
        expect(frobo.frame.parts.length).toEqual 2


    it "Can hold a variety of parts", ->
        #loadPart
        botFrame.loadPart frobo, parts.modules['parts/modules/armatures/grabber']
        botFrame.loadPart frobo, parts.modules['parts/modules/hopper/basic/general']
        expect(frobo.frame.parts.length).toEqual 4


    it "Can remove parts", ->
        #removePart
        botFrame.removePart frobo, 'parts/modules/sensors/sight/basic'
        expect(frobo.frame.parts.length).toEqual 3

    it "Can list parts it contains", ->
        #list
        list = botFrame.listParts frobo
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
        #BotBits.loadHopper botron, res
        #expect(botron.frame.parts['']).toEqual true


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
