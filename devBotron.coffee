common = require './common'

resources = require './Data/resources'
parts = require './Data/parts'
Units = require './Data/structures' # buildings

MachActs = require './commonMachine'
#Refinery = require './refinery'
#Fabricator = require './Fabricator'
Botron = require './botron'
Move = require './move'
#BotActs = require './commonBotron'
#frame = require './frame'
Logger = require './logger'
Mesenger = require './mesenger'
# c = 0
# for x in [0...20]
#     if common.chance(0.5) then c += 1
#
# console.log c, ' of 20'
#
mesenger = new Mesenger.Mesenger

logger = new Logger.Logger
logger.state 'none'

#console.log process.stdout

process.mesenger = mesenger
process.logger = logger

botone = new Botron 'botty botone'
#botone.setLogger logger
botone.addFrame parts.frames['parts/frames/basic']
#console.log parts.sensors['parts/sensors/sight/basic']
botone.loadPart botone, parts.modules['parts/modules/sensors/sight/basic']
botron.loadPart botone, parts.modules['parts/modules/sensors/sight/basic']
botron.loadPart botone, parts.modules['parts/modules/armatures/grabber']
botron.loadPart botone, parts.modules['parts/modules/hopper/basic/general']
botron.loadPart botone, parts.modules['parts/modules/hopper/basic/general']

botron.removePart botone, 'parts/modules/sensors/sight/basic'


#console.log BotBits.listParts botone

scanedResources = Botron.scan botone, resources.raws
#console.log scanedResources
if scanedResources.length > 0
    harvestedResources = Botron.harvest botone, scanedResources

console.log harvestedResources

if harvestedResources.length > 0
    botron.loadHopper botone, harvestedResources
    #console.log harvestedResources


console.log '---------------------------------------------'
#console.log botone

#str = common.inspect botone.frame
#process.stdout.write str


mesenger.add  'xxxxxxxxxxxxxxxx'
mesenger.print()
console.log '---------------------------------------------'
console.log logger.getMsgs()


#console.log botone.getSensor('parts/sensors/sight/basic')
#
#BotActs.scan botone, resources.raws

#move = new Move.Move()
#move.move resources, botone

#botone.move resources
