SMODS.Joker{
    key = "signature",
    atlas = "wjokers",
    pos = { x = 3, y = 2},

    config = {
        extra = {
            chips = 50,
            bonus = false
        }
    },

    loc_txt={
        ['name'] = "Signature",
        ['text'] = {
            "{C:chips}+#1#{} Chips for your",
            "most played {C:attention}poker hand"
        }
    },
    
    rarity = 1,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    unlocked = true,
    discovered = true,

    calculate = function(self, card,context)
        if context.before and not context.blueprint then
            local current_played = (G.GAME.hands[context.scoring_name].played or 0)
            for handname, values in pairs(G.GAME.hands) do
                if handname ~= context.scoring_name and values.played >= current_played and SMODS.is_poker_hand_visible(handname) then
                    card.ability.extra.bonus = false
                    return{
                    }
                end
            end
            card.ability.extra.bonus = true
        elseif context.joker_main and card.ability.extra.bonus then
            return {
                chips = card.ability.extra.chips
            }
        end
    end

}