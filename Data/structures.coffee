compounds = {
    'compounds/basic': {
        name: 'Compound Zefnot'
    }

}

buildings = {
    'structures/buildings/shed/command': {
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
    'structures/buildings/shed/basic': {
        name: 'basic shed'
        max: {
            bays: 10
        }
        bays: []
    }
}

bays = {
    'structures/shed/bay/recharge': {
        type: 'recharge'
        capacity: 1 # number of botrons on charge at this unit
    }
    'structures/shed/bay/storage': {
        type: 'storage'
        capacity: 1000 # number of bulk can contain
    }
    'structures/shed/bay/loading': {
        type: 'loading'
        capacity: 1 # number ofbotrons
    }
    'structures/shed/bay/equipment': {
        type: 'equipment'
        capacity: 5 # number of equipment (fab, lab, ref)
    }
    'structures/shed/bay/command': {
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
