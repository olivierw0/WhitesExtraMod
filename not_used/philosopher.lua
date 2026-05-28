SMODS.Joker {
    key = 'philosopher',
    atlas = 'placeholders',
    -- Not used because of quantum enhancements
    pos = {
        x=0, 
        y=0
    },
    config = {},
    rarity = 1, 
    cost = 4,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {m_gold = true}
    end,
    calculate = function(self, card, context)
        if context.check_enhancement then
            if context.other_card.config.center.key == "m_stone" then
                return {m_gold = true}
            end
        end
    end
}
j_whiteem_philosopher = {
                name = "Philosopher's Stone",
                text = {
                    "{C:attention}Stone Cards{} are also",
                    "considered {C:attention}Gold Cards{}",
                }
            }