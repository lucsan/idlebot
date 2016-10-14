parts = require './parts'

class Frame
    #code: ''
    # name: ''
    # desc: ''

        # uses: [
        #   {code: 'mats/steel', amt: 10}
        #   {code: 'mats/plastic', amt: 2}
        # ]
        # sensors: 2
        # tractors: 1
        # powerUnits: 2
        # ambulators: 1
        # hoppers: 10
        # armatures: 1
        # commandModules: 1


    constructor: (@name) ->

    setFrame: (frame) ->
        for name, value of frame
            struct = {capacity: value, held: 0, items: []}
            @code = value if name == 'code'
            @name = value if name == 'name'
            @desc = value if name == 'desc'
            @uses = value if name == 'uses'
            @sensors = struct if name == 'sensors'
            @tractors = struct if name == 'tractors'
            @powerUnits = struct if name == 'powerUnits'
            @ambulators = struct if name == 'ambulators'
            @hoppers = struct if name == 'hoppers'
            @armatures = struct if name == 'armatures'
            @commandModules = struct if name == 'commandModules'

    getCode: () ->
        @code

    addPart: (part) ->
        codi = part.code.split('/')
        console.log codi[1]
        piece = codi[1]
        piece(part)


    addSensors: (part) ->
        #check capacity
        @sensors.items.push part

f = new Frame
f.setFrame(parts.frames[0])

f.addSensors(parts.sensors[0])
f.addSensors(parts.sensors[0])

console.log f
console.log f.sensors
