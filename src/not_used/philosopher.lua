SMODS.Joker {
    key = 'philosopher',
    atlas = 'wjokers',
    pos = { x = 0, y = 0 },

    loc_txt = {
        ['name'] = "Philosopher's Stone",
        ['text'] = {
            "{C:attention}Stone Cards{} are also",
            "considered {C:attention}Gold Cards{}",
        }
    },

    rarity = 1, 
    cost = 4,
    
    blueprint_compat = false,
    
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.check_enhancement and SMODS.get_enhancements(context.other_card,'m_stone') then
            return {m_gold = true}
        end
    end,

    in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end
}