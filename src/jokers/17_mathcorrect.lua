SMODS.Joker {

    key = 'mathcorrect',
    atlas = 'wjokers',
    pos = { x = 1, y = 3},

    config = {
        extra = {
            xchips = 2.5,
            mult = -17
        }
    },

    rarity = 1,
    cost = 6,

    loc_vars = function (self,info_queue,card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.mult,
            }
        }
    end,

    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then 
                return {
                    xchips = card.ability.extra.xchips,
                    mult = (-mult)+math.max(mult+card.ability.extra.mult, 1)
                }

        end 
    end
}