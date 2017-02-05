compounds = {
    'basic': {
        name: 'Compound Zefnot'
    }

}

buildings = {
    'shed/command': {
        name: 'command shed'
        max: {
            bays: 10
        }
        # max: {
        #     rechargeBay: 1 # to recharge bots
        #     storageBay: 1 # for storing stuff
        #     loadingDock: 1 # to unload a bot
        #     equipmentBay: 5 # slots to place equipment like refinery, assembler and bot chargers
        # }
        bays: []

    }
    'shed/basic': {
        name: 'basic shed'
        max: {
            bays: 10
        }
        bays: []
    }
}

bays = {
    'recharge': {
        type: 'recharge'
        capacity: 1 # number of botrons on charge at this unit
    }
    'storage': {
        type: 'storage'
        capacity: 1000 # number of bulk can contain
    }
    'loading': {
        type: 'loading'
        capacity: 1 # number ofbotrons
    }
    'equipment': {
        type: 'equipment'
        capacity: 5 # number of equipment (fab, lab, ref)
    }
    'command': {
        type: 'equipment'
        capacity: 5 # number of equipment (fab, lab, ref)
    }
}

modifyBays = =>
    for code of bays
        bays[code].code = code
    return bays

module.exports.bays = modifyBays()

modifyBuildings = =>
    for code of buildings
        buildings[code].code = code
    return buildings

module.exports.buildings = modifyBuildings()
