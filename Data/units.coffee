buildings = {
    'building/shed': {
        name: 'command shed'
        rechargeBay: 1 # to recharge bots
        storageBay: 1 # for storing stuff
        loadingDock: 1 # to unload a bot
        equipmentBay: 5 # slots to place equipment like refinery, assembler and bot chargers
    }
}

bays = {
    'shed/bay/recharge': {
        type: 'recharge'
        capacity: 1 # number of botrons on charge at this unit
    }
    'shed/bay/storage': {
        type: 'storage'
        capacity: 1000 # number of bulk can contain
    }
    'shed/bay/loading': {
        type: 'loading'
        capacity: 1 # number ofbotrons
    }
    'shed/bay/equipment': {
        type: 'equipment'
        capacity: 5 # number of equipment (fab, lab, ref)
    }
}

module.exports.buildings = buildings
