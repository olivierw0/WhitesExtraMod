SMODS.Joker {
    key = 'stripmine',
    atlas = 'wjokers',
    pos = { x = 5, y = 3 },

    config = {
        extra = {
            xchip_mod = 0.5,
            xchip = 1,
        }
    },

    rarity = 3, 
    cost = 8,
    
    blueprint_compat = true,
    
    unlocked = true,
    discovered = true,
    enhancement_gate = 'm_stone',

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = {
                card.ability.extra.xchip_mod,
                card.ability.extra.xchip,
            }
        }
    end,

    calculate = function (self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local stone_cards  = 0
            for _, removed_card in ipairs(context.removed) do
                if SMODS.has_enhancement(removed_card,"m_stone") then stone_cards = stone_cards + 1 end
            end
            if stone_cards > 0 then
                card.ability.extra.xchip = card.ability.extra.xchip + stone_cards * card.ability.extra.xchip_mod
                return { message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchip } } }
            end
        end
        if context.joker_main then
            return {card.ability.extra.xchip}
        end
    end

}