common = require './commonMachine'

class Refinery
    @resources = null

    constructor: (@name) ->
        @resources = {}

    loadMaterials: (inputs) =>
        common.loadMaterials(inputs, this)

    refine: (blueprint, amount) =>
        count = 0
        amount = 100 if amount == undefined
        while amount > count
            count += 1
            if !common.refine(blueprint, this)
                break

module.exports.Refinery = Refinery
