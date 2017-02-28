
console.log process.argv

class One
    name = ''
    stuff = ''
    constructor: () ->
        @name = 'baz'

One::thing = (@stuff) =>

One::getStuff = =>
    @stuff

console.log One
console.log 'twoxxx'

eno = new One()
eno.thing 'grass'

console.log eno.getStuff()


makeName = (length) =>
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


console.log makeName()
