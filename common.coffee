# Provide a decimal percentage and the chance it has happened is returned as true or false.
chance = (decimal) =>
    if (rand 1, 100) <= (100 * decimal) then true else false

#
rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)

module.exports.chance = chance
module.exports.rand = rand
