raws = {
    'raws/coal': {
        name: 'coal'
        scan: {'vision': 0.1, 'seismic': 0.8}
        bulk: 1
    }
    'raws/wood/log': {
        name: 'log'
        scan: {'vision': 0.3, 'radar': 0.5}
        make: 'raws/wood'
        tools: {'chainsaw': 1, 'axe': 0.2}
        bulk: 10
    }
    'raws/wood/tree': {
        name: 'tree'
        scan: {'vision': 0.5, 'radar': 0.7}
        make: 'raws/wood' # tree turns into wood
        tools: {'chainsaw': 1, 'axe': 0.2} # tools you can use to harvest this material
        bulk: 100
    }
    'raws/wood': {
        name: 'wood'
        scan: {'vision': 0.2, 'radar': 0.4}
        make: 'raws/wood'
        bulk: 1
    }
    'raws/wood/bush': {
        name: 'wood'
        scan: {'vision': 0.2, 'radar': 0.4}
        make: 'raws/wood'
        bulk: 1
    }
    'raws/grass': {
        name: 'grass'
        scan: {'vision': 0.8, 'radar': 0.4}
        make: 'raws/fiber'
        tools: {'grabber': 0.4, 'scyth': 0.6, 'mower': 0.8}
        bulk: 1
    }
    'raws/stone/pebble': {
        name: 'pebble'
        scan: {'vision': 0.8, 'radar': 0.4}
        make: 'raws/stone'
        tools: {'grabber': 0.5}
        bulk: 1
    }
    'raws/iron/boulder': {
        name: 'iron boulder'
        scan: {'vision': 0.1, 'radar': 0.2, 'detect': 0.8}
        make: 'raws/iron'
        bulk: 50
    }
    'raws/iron': {
        name: 'iron'
        scan: {'vision': 0.1, 'radar': 0.2, 'detect': 0.8}
        bulk: 3
    }
    'raws/gold': {
        name: 'gold'
        bulk: 3
    }
    'raws/copper': {
        name: 'copper ore'
        bulk: 3
    }
    'raws/quartz': {
        name: 'quartz'
        bulk: 2
    }
    'raws/sand': {
        name: 'sand'
        bulk: 1
    }
    'raws/sulphur': {
        name: 'sulphur'
        bulk: 1
    }
}

# all bulk of 1
mats = { # requires refinery blueprints - any mat in uses makes 1
    'mats/fuel': { #output
        name: 'fuel'
        uses: {'raws/coal': 2, 'raws/oil': 1, 'mats/celulose': 1, 'raws/coal': 1, 'mats/polymer': 3} # any of these needed to create a bulk of 1
    }
    'mats/polymer': {
        name: 'polymer'
        desc: 'Base plastic material for making vareous types of plastic.'
        uses: {'mats/fuel': 2, 'raws/coal': 4, 'raws/oil': 2, 'mats/celulose': 5}
    }
    'mats/wood': {
        name: 'wood blocks'
        uses: {'raws/log': 0.1, 'raws/wood': 1.3}
    }
    'mats/iron': {
        name: 'iron'
        uses: {'raws/iron': 2}
    }
    'mats/steel': {
        name: 'steel'
        uses: {'mats/iron': 2}
    }
    'mats/glass': {
        name: 'glass'
        uses: {'raws/sand': 2}
    }
    'mats/celulose': {
        name: 'celulose'
        desc: 'Starch like material extracted from organic material.'
        uses: {'raws/grass': 1, 'raws/wood': 1}
    }
    'mats/copper': {
        name: 'copper'
        uses: {'raws/copper': 2}
    }
    'mats/copper/wire': {
        name: 'copper wire'
        uses: {'mats/copper': 1}
    }
}

# all bulk of 1
aloys = { #combos
    'aloys/brass': {
        name: 'brass'
        uses: {'mats/copper': 0.5, 'mats/zinc': 0.5}
    }
}


modifyMaterials = () =>
    for code of mats
        mats[code].code = code
        mats[code].bulk = 1
    return mats


module.exports.raws = raws #Harvested resources
module.exports.mats = modifyMaterials() # mats #Processed resources
module.exports.aloys = aloys #Processed resources
