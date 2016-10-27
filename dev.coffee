resources = require './resources'
parts = require './parts'
Units = require './units' # buildings
common = require './commonMachine'
Refinery = require './refinery'
Fabricator = require './Fabricator'
Botron = require './botron'
Move = require './move'
BotActs = require './commonBotron'
BotBits = require './commonFrame'
logger = require './logger'
# c = 0
# for x in [0...20]
#     if common.chance(0.5) then c += 1
#
# console.log c, ' of 20'
#
#
botone = new Botron.Botron 'botty botone'
botone.addFrame parts.frames['parts/frames/basic']
#console.log parts.sensors['parts/sensors/sight/basic']
BotBits.loadPart botone, parts.modules['parts/modules/sensors/sight/basic']
BotBits.loadPart botone, parts.modules['parts/modules/sensors/sight/basic']
BotBits.loadPart botone, parts.modules['parts/modules/armatures/grabber']
BotBits.loadPart botone, parts.modules['parts/modules/hopper/basic/general']
BotBits.loadPart botone, parts.modules['parts/modules/hopper/basic/general']

BotBits.removePart botone, 'parts/modules/sensors/sight/basic'


#console.log BotBits.listParts botone

scanedResources = BotActs.scan botone, resources.raws
#console.log scanedResources
if scanedResources.length > 0
    harvestedResources = BotActs.harvest botone, scanedResources

if harvestedResources.length > 0
    BotBits.loadHopper botone, harvestedResources
    console.log harvestedResources


console.log '---------------------------------------------'
console.log botone
logger.state 'console'
logger.info 'Built botone'
console.log '---------------------------------------------'


#console.log botone.getSensor('parts/sensors/sight/basic')
#
#BotActs.scan botone, resources.raws

#move = new Move.Move()
#move.move resources, botone

#botone.move resources
