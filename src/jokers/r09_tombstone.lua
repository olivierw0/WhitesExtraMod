SMODS.Joker {
    key = "tombstone",
    atlas = 'wjokers',
    pos = { x = 5, y = 0 },
    pixel_size = {h=95/1.10},
        
    rarity = 1, 
    cost = 4,
    
    unlocked = true,
    discovered = true,

    loc_vars = function (self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone    
    end,

    calculate = function(self,card,context)
        if context.remove_playing_cards then 
            local stone_card = nil
            for _, k in ipairs(context.removed) do
                if not SMODS.has_enhancement(k,'m_stone') then
                    stone_card = SMODS.add_card { set = "Base", enhancement = "m_stone", area = G.deck }
                    SMODS.calculate_effect({message = localize('k_plus_stone'), colour = G.C.SECONDARY_SET.Enhanced}, card)                    
                    SMODS.calculate_context({playing_card_added = true, cards = { stone_card }})
                end
            end
            G.deck:shuffle('not_bottom')
            return
        end 
    end,
}