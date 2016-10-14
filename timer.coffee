# A timer class which runs for a set length of time.

module.exports = class Timer
  constructor: (@timeUp, @func) ->

  stop: 0
  count: 0

  # Pass in a function. This is where all the work is done.
  main: =>
    @func?() ? console.log "> " + @count++

  running: =>
    @main()
    setTimeout(@running, 1000) if @stop is 0 # and @count < 10 # debug break.

  start: =>
    @timeUp = 5000 if @timeUp is 0
    setTimeout(@halt, @timeUp)
    @running()

  halt: =>
    @stop = 1



###
Example use.
Timer = require "./timer"
timer = new Timer(3000, func)
timer.start()
###
