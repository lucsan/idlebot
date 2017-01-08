module.exports.loadFrame = (botron, frame) =>
    botron.frame = frame
    botron.frame.modules = []

module.exports.loadModule = (botron, botronModule) =>
    slotCode = botronModule.slot.split('/')
    modSlot = slotCode[slotCode.length - 1]
    max = botron.frame.max[modSlot]
    counter = 0
    counter++ for i, module of botron.frame.modules when module.slot is botronModule.slot
    if counter >= max then return
    botron.frame.modules.push botronModule

module.exports.scan = (botron, rawResourcesList) ->
    return [] if botron.frame.modules.length < 1
    sensors = canThing(botron, 'frame/modules/sensors')
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
                    @foundResources.push raws[code]
                    #process.logger.info botron.name + ' scanned - ' + raws[code].scan[type] + ' ' +  code
    return @foundResources

canThing = (botron, moduleCode) =>
    a = []
    for i, modules of botron.frame.modules when modules.slot == moduleCode
        a.push modules
    return a

module.exports.harvest = (botron, scanedResources) =>
    return [] if botron.frame.modules.length < 1
    armatures = canThing(botron, 'frame/modules/armatures')
    return [] if armatures.length < 1
    harvestedResources = []
    for code of scanedResources
        if scanedResources[code].tools
            for tool of scanedResources[code].tools
                for arm in armatures
                    if arm.gene == tool
                        harvestPercent = scanedResources[code].tools[tool]
                        bulk = scanedResources[code].bulk
                        scanedResources[code].harvestAmount = bulk * harvestPercent
                        harvestedResources.push scanedResources[code]
    return harvestedResources
