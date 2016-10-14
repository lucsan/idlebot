

class Building

    constructor: (@blueprint) ->
        rechargeBay = {}
        storageBay = {}
        loadingDock = {}
        equipmentBay = {}

    getRechargeBayCapacity: () =>
        @blueprint.rechargeBay

    getStorageBayCapacity: () =>
        @blueprint.storageBay


module.exports.Building = Building
