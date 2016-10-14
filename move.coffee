
# move - search, return
# On a move order pass a botron to move

class Move
    constructor: (@timeUp) ->

    move: (resources, botron) =>
        @scan()
        @harvest()

    return: () =>
        #botron returns (position -1)

    scan: () =>
        console.log 'scan called'
        found = []

    harvest: () =>

module.exports.Move = Move


# move = new Move()
# move.move()
# console.log move
