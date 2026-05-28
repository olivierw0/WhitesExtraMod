SMODS.Joker {
    key = "molten",
    atlas = 'wjokers',
    pos = { x = 4, y = 0 },

    config = { 
        extra = { 
            dollars = 8 
        } 
    },

    rarity = 2,
    cost = 7,

    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars} }
    end,


    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (SMODS.has_enhancement(context.other_card, 'm_gold') or SMODS.has_enhancement(context.other_card, 'm_steel')) then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function ()
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        func = function()
                            context.card:set_ability(G.P_CENTERS["m_stone"])
                            return true
                        end
                    }))
                    return true
                end
            }
        end
    end

}