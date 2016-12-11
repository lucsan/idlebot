# universal functions available at a global level (ie: pushed to the process).
# Probaly most functions currently in common

class Plan
    constructor: (@blueprint) ->
        for item, value of @blueprint
            @[item] = value
        #@name = common.makeName()
