#Move = require './move'
#resources = require './resources'
# contains bot data for a bot
class Botron
    position = [] # this build only first position is used. [1,0,0]
    location = '' # in bay (loading, charging), outside
    state = null # on or off
    delay = null # cycle time for bot (ie: speed it moves at - therefore harvests at)
    canCarry = null
    carrying = null
    canMove = null

    constructor: (@name) ->
        @position = [0,0,0]
        @state = 'off'
        @delay = 1

    setLogger: (@logger) =>

    addFrame: (@frame) =>

    systemsCheck: () =>
        # has all necessary parts and components (canMove, canScan, canHarvest)
        # caclulate bulk
        # has power and fuel
        # all ok? turn on bot

    runningCheck: () =>
        #is still operational

    inspect: () =>
        for part in @frame.parts
            p = JSON.stringify(part)
            ps = p.split(',')
            for s in ps
                process.stdout.write s + '\n'
            process.stdout.write '\n'

module.exports.Botron = Botron
