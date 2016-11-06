# This should be the game clock, moving game time on
#
#Example use.
#
# A timer class which runs for a set length of time.

module.exports = class Timer
    constructor: (@timeUp, @func) ->

    stop: 0
    count: 0

    # Pass in a function. This is where all the work is done.
    main: =>
        #@func?() ? console.log "> " + @count++
        @count++
        @func()

    running: =>
        @main()
        setTimeout(@running, 1000) if @stop is 0 # and @count < 10 # debug break.

    start: =>
        @timeUp = 5000 if @timeUp is 0
        setTimeout(@halt, @timeUp)
        @running()

    halt: =>
        @stop = 1

    getTick: =>
        @count


class miniBot
    constructor: ->

    doings: 0
    state: 'waiting'

    needsUpdating: =>
        @doings++ if @state == 'running'

    getDoings: =>
        'miniBot done ' + @doings

    setState: (state) =>
        @state = state

mb = new miniBot()

# get keyboard input
stdin = process.openStdin()
stdin.setEncoding 'utf8'

stdin.on 'data', (input) ->
    line = input.trim()
    lineOfinputReceived(line)

lineOfinputReceived = (inputLine) =>
    process.exit() if inputLine == 'exit' || inputLine == 'x'
    information(inputLine) if inputLine == 'i'
    action inputLine

action = (inputLine) =>
    mb.setState('running') && console.log 'bot running' if inputLine == 'br'
    mb.setState('waiting') && console.log 'bot stopped' if inputLine == 'bs'


information = (inputLine) =>
    console.log 'timer', timer.getTick()
    console.log 'minibot', mb.getDoings()
    console.log "CMD: #{inputLine}"
    #console.log "Enter another line or 'exit' to exit"

# The main program function (the update function)
func = () ->
    mb.needsUpdating()
    #console.log 'fnk'

console.log 'Instructions:'
console.log 'i for info'
console.log 'br for bot run'
console.log 'bs for bot stop'
console.log 'x to exit'

# Start the program
timer = new Timer(30000, func)
timer.start()
