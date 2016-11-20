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

module.exports.makeName = (length) =>
    length = 6 if length == undefined
    t = (Math.round length / 3) + 1
    block = ''
    while t -= 1
        block += getConstonant() + getVowel() + getConstonant()
    return block

getVowel = =>
    vowels = ['a', 'e', 'i', 'o', 'u', 'y']
    vowels[rand 1, vowels.length]

getConstonant = =>
    constonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']
    constonants[rand 1, constonants.length]

rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)



    # s = ''
    # for obj in thing
    #     console.log obj
    #     arr = JSON.Stringify obj
    #     ars = arr.split ','
    #     for a in ars
    #         s += a + '\n'
    # return s
