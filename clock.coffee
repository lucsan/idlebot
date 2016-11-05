# This should be the game clock, moving game time on
#
#Example use.
func = () ->
    console.log 'fnk'

Timer = require "./timer"
timer = new Timer(3000, func)
timer.start()
