module.exports = class Timer
    constructor: (@func) ->

    stop: 0
    count: 0

    # Pass in a function. This is where all the work is done.
    main: =>
        #@func?() ? console.log "> " + @count++
        @count++
        @func()

    running: =>
        @main()
        setTimeout(@running, 1000);# if @stop is 0 # and @count < 10 # debug break.

    start: =>
        #@timeUp = 5000 if @timeUp is 0
        #setTimeout(@halt, @timeUp)
        @running()

    halt: =>
        process.exit()
        #@stop = 1

    getTick: =>
        @count
