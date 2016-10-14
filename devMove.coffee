# scan for resource
# amunt of resource found
# amount colectable per cycle
# all collected
#
# as the bot moves it may detect resource at the edge of its scan range.
# as the bot moves towards a resource it may detect another resource at the edge of its range.
# it will collect each resource in turn.

resources = require './resources'
parts = require './parts'
Buildings = require './buildings'
common = require './common_machine'
Refinery = require './refinery'
Assembler = require './assembler'
Mesenger = require './Mesenger'

mesenger = new Mesenger.Mesenger()

messageHandler = (e) => console.log 'message- ' + e

scan = () =>
    #addEventListener "message", (e) => messageHandler(e)
    found = []
    possition = [0,0]
    range = 10
    hopper = 10
    things = {  'raws/grass': 0.8, 'raws/stone/pebble': 0.4, 'raws/wood/bush': 0.3, 'raws/wood/tree': 0.4}

    for code of things
        if chance(things[code]) == true then found.push code

    if found.length < 1 then found.push 'raws/grass'
    return found
        #msg = "found #{code}"
        #console.log
        #mesenger.add(msg)

        #if found then harvest(code)
        #if found then return code




  # body..."harvested #{harvest}"


harvest = (code) =>
    # find item ie: tree
    item = resources.raws[code]
    #console.log item
    # get bulk available
    bulk = item.bulk
    #console.log bulk

    # get if has tools
    machine = {}
    machine.tools = {}
    machine.tools.arm = {'grabber'}
    quantity = 0
    if item.name == 'grass'
        quantity = item.tools['grabber']

    # calc how much is Harvested
    harvested = bulk * quantity

    mesenger.add("harvested #{harvested} #{code}")



move = (machine) =>
    # The bot dosen't actually move in this build
    # it scans and harvests (more like a game move)
    #
    # each move move the bot 1 away from base (position[1,0,0])
    # for 40% of its fuel (or the hopper is full), then moves back to base (auto behaviour)
    # each move it gathers some resource
    # if comand module requires a specfic resource a minor bonus modifyer is applied to finding and gathering
    #

    foundCodes = scan()
    mesenger.add('found ' + foundCodes)
    for code in foundCodes
        console.log code
        harvest(code)

    # check if hopper is full
    # put in hopper (fill hopper)
    # calculate hazzard (falls in a hole)
    # calcuate wear and tear (parts health)
    #
    # move again


finding = (resource) =>
    #x = chance resource


chance = (decimal) =>
    if (rand 1, 100) <= (100 * decimal) then true else false


rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)


#finding({'tree': 0.5})

machine = {}
move(machine)

mesenger.print()
#a = (x for x in [0...10])
#
# c = 0
# for x in [0...20]
#     x = chance 0.8
#     c = c + 1 if x
# console.log c

    #console.log rand(1,6)

#range = Math.random() * (max - min) + min
