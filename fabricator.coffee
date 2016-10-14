common = require './common_machine'

# change to Fabricator
class Fabricator
    @resources = null

    constructor: (@name) ->
        @resources = {}

    loadMaterials: (inputs) =>
        common.loadMaterials(inputs, this)

    assemble: (blueprint, amount) =>
        count = 0
        amount = 100 if amount == undefined
        while amount > count
            count += 1
            if !common.assemble(blueprint, this)
                break


module.exports.Fabricator = Fabricator

        # count = 0
        # amount = 100 if amount == undefined
        # while amount > count
        #     count += 1
        #     if !common.refine(blueprint, this)
        #         break
