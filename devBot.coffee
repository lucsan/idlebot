resources = require './resources'
parts = require './parts'
Buildings = require './buildings'
common = require './commonMachine'
Refinery = require './refinery'
Assembler = require './assembler'

class Botron
    @sensors = null
    constructor: (@name) ->
        @sensors = []

    addFrame: (@frame) =>

    addSensor: (sensor) =>
        if @sensors.length == @frame.sensors then return
        @sensors.push sensor



bot = new Botron('billy')

bot.addFrame(parts.frames['parts/frames/basic'])
bot.addSensor(parts.sensors['parts/sensors/sight/basic'])
bot.addSensor(parts.sensors['parts/sensors/sight/basic'])
bot.addSensor(parts.sensors['parts/sensors/sight/basic'])

console.log bot
