resources = require './resources'
parts = require './parts'
Units = require './units' # buildings
common = require './common_machine'
Refinery = require './refinery'
Fabricator = require './Fabricator'
Botron = require './botron'
Move = require './move'
# c = 0
# for x in [0...20]
#     if common.chance(0.5) then c += 1
#
# console.log c, ' of 20'
#
#
botone = new Botron.Botron 'botty'
botone.addFrame parts.frames['parts/frames/basic']
#console.log parts.sensors['parts/sensors/sight/basic']
botone.addSensor parts.sensors['parts/sensors/sight/basic']
botone.addSensor parts.sensors['parts/sensors/sight/basic']

console.log botone
#console.log botone.getSensor('parts/sensors/sight/basic')

move = new Move.Move()
move.move resources, botone

#botone.move resources
