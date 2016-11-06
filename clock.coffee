# This should be the game clock, moving game time on
#



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


    #console.log 'fnk'

console.log 'Instructions:'
console.log 'i for info'
console.log 'x to exit'
