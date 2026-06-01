SMODS.Joker{
    key = 'communism',
    atlas = 'wjokers',

    pos = { x = 0, y = 0},

    config = {
        extra = {
            consumable_slot = -1,
            mult = 17
        }
    },

    loc_txt = {
        ['name'] = 'Communist Joker',
        ['text'] = {
            [1] = '{C:red}#1#{} consumable slot',
            [2] = '{C:mult}+#2#{} Mult',
        }
    },

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.minus_slot,
                card.ability.extra.mult,
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