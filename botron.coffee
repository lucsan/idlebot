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

    # move: (resources) =>
    #     # check bot can move (has tractor, fuel, and ambulator)
    #     @go = new Move.Move()
    #     @go.move(resources, this)

    addFrame: (@frame) =>

    #addArmature: (@armature) =>

    #addTractor: (@tractor) =>

    systemsCheck: () =>
        # has all necessary parts and components (canMove, canScan, canHarvest)
        # caclulate bulk
        # has power and fuel
        # all ok? turn on bot

    runningCheck: () =>
        #is still operational

module.exports.Botron = Botron
