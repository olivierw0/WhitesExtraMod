SMODS.Joker{
    key = "mulligan",
    atlas = "wjokers",
    
    pos = {x = 6, y = 2},
    soul_pos = {x = 6, y = 3},

    unlocked = true,
    discovered = true,

    blueprint_compat = false,

    rarity = 1,
    cost = 3,

    calculate = function (self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

        if context.stay_flipped and not context.blueprint and context.from_area == G.hand and context.to_area == G.discard and G.GAME.current_round.discards_used == 1 then
            return {
                modify = {to_area = G.deck},
                G.deck:shuffle('mulligan')
            }
        end
    end
}

