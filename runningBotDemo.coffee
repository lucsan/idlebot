# main controller for the program

# import list
common = require './common'
# Data
resources = require './Data/resources'
parts = require './Data/parts'
#Units = require './Data/units' # buildings
# Classes and actions
MachActs = require './commonMachine'
#Refinery = require './refinery'
#Fabricator = require './Fabricator'
Botron = require './botron'
Move = require './move'
#BotActs = require './commonBotron'
#BotBits = require './commonFrame'
Logger = require './logger'
Mesenger = require './mesenger'
Timer = require "./timer"
#clock = require './clock'
# get user class and populate with saved user data.

#user = new User.User('baz')

#console.log user
#$franchise = new Franchise.Franchise('baz place')
# start the show

#console.log user.franchise.buildings

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
    timer.halt() if inputLine == 'halt'


information = (inputLine) =>
    console.log 'timer', timer.getTick()
    console.log 'minibot', mb.getDoings()
    console.log "CMD: #{inputLine}"
    #console.log "Enter another line or 'exit' to exit"


    #console.log 'fnk'

console.log 'Instructions:'
console.log 'i for info (display output)'
console.log 'br turn bot on (bot run)'
console.log 'bs stop bot'
console.log 'x to exit'


# The main program function (the update function)
func = () ->
    mb.needsUpdating()

# Start the program
timer = new Timer(func)
timer.start()
