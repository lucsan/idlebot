loadMaterials = (@inputs, @machine) =>
    for code, amt of @inputs
        @machine.resources[code] = 0 if @machine.resources[code] == undefined
        @machine.resources[code] += amt


refine = (blueprint, machine) =>
    for code of blueprint.uses
        if blueprint.uses[code] <= machine.resources[code]
            transform(code, blueprint, machine)
            machine.resources[blueprint.code] += 1
        else
            false

assemble = (blueprint, machine) =>
    fnd = true
    for code of blueprint.uses
        fnd = false if machine.resources[code] < blueprint.uses[code] || machine.resources[code] == undefined
    if fnd
        for code of blueprint.uses
            transform(code, blueprint, machine)
        machine.resources[blueprint.code] += 1
    else
        false

transform = (code, blueprint, machine) =>
    machine.resources[blueprint.code] = 0 if machine.resources[blueprint.code] == undefined
    machine.resources[code] -= blueprint.uses[code]
    machine.resources[code] = machine.resources[code].toFixed(1)

# Provide a decimal percentage and the chance it has happened is returned as true or false.
chance = (decimal) =>
    if (rand 1, 100) <= (100 * decimal) then true else false

#
rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)


module.exports.loadMaterials = loadMaterials
module.exports.refine = refine
module.exports.assemble = assemble
module.exports.chance = chance
module.exports.rand = rand
