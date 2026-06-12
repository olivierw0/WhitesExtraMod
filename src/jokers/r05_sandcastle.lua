SMODS.Joker {
    key = 'sandcastle',
    atlas = 'wjokers',
    pos = { x = 6, y = 0},

    blueprint_compat = true,

    rarity = 1,
    cost = 4,

    enhancement_gate = 'm_stone',

    config = {
        extra = {
            stones = 2,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        
        local stone_tally = 0
        for k, v in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, 'm_stone') then stone_tally = stone_tally + 1 end
        end
        
        return {
            vars = {card.ability.extra.stones, math.floor(stone_tally/card.ability.extra.stones)}
        }
    end,

    calculate = function(self, card, context)
        
        if context.setting_blind then

            local stone_tally = 0
            for _, k in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(k,'m_stone') then
                    stone_tally = stone_tally + 1
                end
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_hands_played(math.floor(stone_tally/card.ability.extra.stones))
                    SMODS.calculate_effect(
                        { message = localize { type = 'variable', key = 'a_hands', vars = { math.floor(stone_tally/card.ability.extra.stones) } } },
                        context.blueprint_card or card)
                    return true
                end
            }))                    
        end
    end,
}