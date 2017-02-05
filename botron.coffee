
module.exports.loadFrame = (botron, frame) =>
    botron.frame = frame
    botron.frame.modules = []

module.exports.loadModule = (botron, botronModule) =>
    slotCode = botronModule.slot.split('/')
    max = botron.frame.max[slotCode[0]]
    counter = 0
    counter++ for i, module of botron.frame.modules when module.slot is botronModule.slot
    if counter >= max then return
    botron.frame.modules.push botronModule

module.exports.scan = (botron, rawResourcesList) ->
    return [] if botron.frame.modules.length < 1
    sensors = getModulesByType botron, 'sensors'
    #console.log sensors
    return [] if sensors.length < 1
    # check environmental availability (not yet implemented)
    # calculate what it can see for each sensors
    foundResources = []
    for sensor in sensors
        doScan sensor, rawResourcesList, foundResources, botron
    # return list of found resources
    return foundResources

doScan = (sensor, raws, @foundResources, botron) =>
    #process.logger.info botron.name + ' scanning with - ' + sensor.code
    # get raws which can be found by this sensor
    gene = sensor.gene
    for code of raws
        if raws[code].scan
            for type of raws[code].scan
                if type == sensor.gene
                    # use scan value (ie: vision: 0.8) to calculate chanch this resource is spotted.
                    raws[code].scanChance = raws[code].scan[type]
                    raws[code].code = code
                    @foundResources.push raws[code]
                    #process.logger.info botron.name + ' scanned - ' + raws[code].scan[type] + ' ' +  code
    return @foundResources

getModulesByType = (botron, moduleCode) =>
    codes = moduleCode.split('/')
    a = []
    for i, modules of botron.frame.modules
        slots = modules.slot.split('/');
        a.push modules if codes[0] == slots[0]
    return a

module.exports.harvest = (botron, scanedResources) =>
    return [] if botron.frame.modules.length < 1
    armatures = getModulesByType botron, 'armatures'
    return [] if armatures.length < 1
    harvestedResources = []

    for i of scanedResources
        if scanedResources[i].tools
            for tool of scanedResources[i].tools
                for arm in armatures
                    if arm.gene == tool
                        harvest = []
                        harvest.code = scanedResources[i].code
                        harvest.toolUsed = tool
                        harvestPercent = scanedResources[i].tools[tool]
                        harvest.harvestPercent = harvestPercent
                        bulk = scanedResources[i].bulk
                        harvest.bulk = scanedResources[i].bulk
                        harvest.harvestAmount = bulk * harvestPercent
                        harvestedResources.push harvest
    return harvestedResources

module.exports.loadHopper = (botron, foundResources) =>
    return if botron.frame.modules.length < 1
    hoppers = getModulesByType botron, 'hoppers'
    return if hoppers.length < 1
    for i, hopper of hoppers
        for j, resource of foundResources
            break if (hopper.carrying + resource.harvestAmount) > hopper.capacity
            hopper.contains.push resource
            hopper.carrying += resource.harvestAmount



# module.exports.getModule = (botron, moduleCode) =>
#     console.log botron.frame.modules


module.exports.info = (botron) =>
    name = botron.name
    frame = botron.frame
    #sensors = canThing(botron, 'frame/modules/sensors')
    info  = "\nInfo: \n"
    info += 'name :   ' + name + "\n"
    info += 'frame:   ' + frame
    #info += 'sensors: ' + sensors
