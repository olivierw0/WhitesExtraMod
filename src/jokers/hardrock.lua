SMODS.Joker {
    key = "hardrock",
    --atlas = "placeholders.png",
    pos = { x = 0, y = 0 },
    
    config = {
        extra = {
            xchips = 2
        }
    },

    rarity = 3, 
    cost = 8,

    loc_vars = function (self,info_queue,card)
        return {
            vars = {
                card.ability.extra.xchips
            }
        }        
    end,


    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play 
        and SMODS.has_enhancement(context.other_card,'m_stone') then 
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end
}