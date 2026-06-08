SMODS.Joker{
    key = 'toofull',
    atlas = 'wjokers',

    pos = { x = 0, y = 3},

    config = {
        extra = {
            mult = 15,
            consumable_slot = -1,
        }
    },

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.consumable_slot,
            }
        }
    end,

    rarity = 1,
    cost = 4,

    unlocked = true,
    discovered = true,

    calculate = function(self,card,context)
        if context.joker_main then 
            return { mult = card.ability.extra.mult }
        end
    end,

    add_to_deck = function(self,card,from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable_slot
    end,

    remove_from_deck = function(self,card,from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumable_slot
    end
}