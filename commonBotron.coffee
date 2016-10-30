# Common botron functions.
# 
module.exports.scan = (botron, raws) =>
    # check the bot can scan
    #if !sensors = canScan botron then return
    if !sensors = canDo botron, 'frame/modules/sensors' then return
    # check environmental availability (not yet implemented)
    # calculate what it can see for each sensors
    foundResources = []
    for sensor in sensors
        doScan sensor, raws, foundResources, botron
    # return list of found resources
    return foundResources

doScan = (sensor, raws, @foundResources, botron) =>
    process.logger.info botron.name + ' scanning with - ' + sensor.code
    # get raws which can be found by this sensor
    gene = sensor.gene
    for code of raws
        if raws[code].scan
            for type of raws[code].scan
                if type == sensor.gene
                    # use scan value (ie: vision: 0.8) to calculate chanch this resource is spotted.
                    raws[code].scanChance = raws[code].scan[type]
                    @foundResources.push raws[code]
                    process.logger.info botron.name + ' scanned - ' + raws[code].scan[type] + ' ' +  code
    return @foundResources

canDo = (botron, slotCode) =>
    things = []
    for part in botron.frame.parts
        if part.slot == slotCode
            things.push part
    things = null if things.length < 1
    return things


module.exports.harvest = (botron, foundResources) =>
    # recieves a list of found (scaned) resources
    # check bots harvesting tools
    # canHarvest - has armatures - get list of armatures
    if !arms = canDo botron, 'frame/modules/armatures' then return
    #console.log  'harvesting with \n', arms
    harvestedResources = []
    for code of foundResources
        if foundResources[code].tools
            for tool of foundResources[code].tools
                for arm in arms
                    #console.log arm, tool
                    if arm.gene == tool
                        # calculate amount harvested
                        harvestPercent = foundResources[code].tools[tool]
                        bulk = foundResources[code].bulk
                        foundResources[code].harvestAmount = bulk * harvestPercent
                        harvestedResources.push foundResources[code]
                        process.logger.info botron.name + ' harvesting - with ' + tool + ', found - ' + foundResources[code].harvestAmount + ' ' + foundResources[code].name
                #console.log tool
    if harvestedResources.length < 1 then return
    # return list of resources and amounts harvested
    return harvestedResources

move = (botron) =>
