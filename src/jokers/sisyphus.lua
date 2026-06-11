SMODS.Joker {
    key = "sisyphus",
    atlas = 'wjokers',
    pos = { x = 4, y = 4 },

    config={
        extra = {
            xmult_gain = 0.75,
            xmult = 1
        }
    },
    
    rarity = 3, 
    cost = 8,
    
    perishable_compat = false,

    unlocked = true,
    discovered = true,

    enhancement_gate = 'm_stone',

    loc_vars = function (self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self,card,context)
        if context.before then
            local reset = true
            for _, v in ipairs(context.scoring_hand) do 
                if SMODS.has_enhancement(v,'m_stone') and not v.debuff then
                    reset = false
                    break
                end
            end

            if reset then
                card.ability.extra.xmult = 1
                return{
                    message = "Rolling Down!",
                    colour = HEX("808080")
                }
            else
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return{
                    message = 'Rolling Up...',
                    colour = HEX("808080")
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}