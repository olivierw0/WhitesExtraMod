SMODS.Joker {
    key = "jungle",
    --atlas = "placeholders.png",
    pos = { x = 0, y = 0},

    config = {
        extra = {
            xmult = 1.5
        }
    },

    rarity = 3, 
    cost = 8,

    loc_vars = function (self,info_queue,card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }        
    end,


    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play 
        and SMODS.has_enhancement(context.other_card,'m_wild') then 
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}