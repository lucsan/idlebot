# Common botron functions.


scan = (botron, raws) =>
    # check the bot can scan
    #if !sensors = canScan botron then return
    if !sensors = canDo botron, 'frame/modules/sensors' then return
    # check environmental availability (not yet implemented)
    # calculate what it can see for each sensors
    foundResources = []
    for sensor in sensors
        doScan sensor, raws, foundResources
    # return list of found resources
    return foundResources

doScan = (sensor, raws, @foundResources) =>
    console.log  'scanning with ' + sensor
    # get raws which can be found by this sensor
    gene = sensor.gene
    for code of raws
        if raws[code].scan
            for type of raws[code].scan
                if type == sensor.gene
                    # use scan value (ie: vision: 0.8) to calculate chanch this resource is spotted.
                    raws[code].scanChance = raws[code].scan[type]
                    @foundResources.push raws[code]
    return @foundResources



canDo = (botron, slotCode) =>
    things = []
    for part in botron.frame.parts
        if part.slot == slotCode
            things.push part
    things = null if things.length < 1
    return things


harvest = (botron, foundResources) =>
    # recieves a list of found (scaned) resources
    # check bots harvesting tools
    # canHarvest
    if !arms = canDo botron, 'frame/modules/armatures' then return

    #console.log foundResources
    console.log  'harvesting with ', arms
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
                #console.log tool
    if harvestedResources.length < 1 then return
    # return list of resources and amounts harvested
    return harvestedResources


move = (botron) =>


module.exports.scan = scan
module.exports.harvest = harvest
