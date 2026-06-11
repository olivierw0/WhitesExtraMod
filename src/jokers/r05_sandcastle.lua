SMODS.Joker {
    key = 'sandcastle',
    atlas = 'wjokers',
    pos = { x = 0, y = 6},

    blueprint_compat = true,

    rarity = 1,
    cost = 4,

    config = {
        extra = {
            stones = 2,
        }
    },

    loc_vars = function(self, info_queue, card)

        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        local stone_cpt = 0

        for k, v in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, 'm_stone') then stone_cpt = stone_cpt + 1 end
        end
        return {
            vars = {card.ability.extra.stones, math.floor(stone_cpt/card.ability.extra.stones)}
        }
    end,

    calculate = function(self, card, context)

        if context.setting_blind then
            local stone_cpt = 0

            for k, v in pairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, 'm_stone') then stone_cpt = stone_cpt + 1 end
            end

            if stone_cpt >= card.ability.extra.stones then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_hands_played(math.floor(stone_cpt/card.ability.extra.stones))
                        return true 
                    end 
                }))
            end
        end
    end,

    in_pool = function(self, args) 
        local stone_cpt = 0
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                stone_cpt = stone_cpt + 1
            end
        end
        if stone_cpt >= 2 then return true else return false end
    end
}