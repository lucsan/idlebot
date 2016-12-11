# Provide a decimal percentage and the chance it has happened is returned as true or false.
module.exports.chance = (decimal) =>
    if (rand 1, 100) <= (100 * decimal) then true else false

#
module.exports.rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)

module.exports.inspect = (thing) =>
    s = ''
    for item of thing
        s += item + ': '
        if typeof thing[item] == 'object' and thing[item].length != null
            strs = JSON.stringify(thing[item]).split(',')
            for str in strs
                s += str + ',\n'
        else
            s += thing[item] + '\n'
    return s

makeName = (length) =>
    length = 2 if length == undefined
    name = ''
    for i in [1..length]
        name += getConstonant() + getVowel() + getConstonant()
    return name

getVowel = =>
    vowels = ['a', 'e', 'i', 'o', 'u', 'y']
    vowels[rand 1, vowels.length]

getConstonant = =>
    constonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']
    constonants[rand 1, constonants.length]

rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)

class Plan
    constructor: (blueprint) ->
        for item, value of blueprint
            @[item] = value
        @name = makeName() if @name == undefined

newPlan = (blueprint) =>
    new Plan blueprint

module.exports.newPlan = newPlan
module.exports.Plan = Plan
module.exports.makeName = makeName
    # s = ''
    # for obj in thing
    #     console.log obj
    #     arr = JSON.Stringify obj
    #     ars = arr.split ','
    #     for a in ars
    #         s += a + '\n'
    # return s
