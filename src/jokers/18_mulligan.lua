SMODS.Joker{
    key = "mulligan",
    atlas = "wjokers",
    
    pos = {x = 6, y = 2},

    unlocked = true,
    discovered = true,

    calculate = function (self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

        if context.pre_discard and not context.blueprint then
            print("test prediscard")
            return {
                func = function ()
                    local dcard = #G.discard.cards
                    print("#G.discard.cards : ", #G.discard.cards)
                    for i = dcard, 1, -1 do
                        G.E_MANAGER:add_event(Event({
                            function ()
                                local drawn_c = G.discard:remove_card()
                                if not drawn_c then 
                                    print("nothing to place back")
                                    return true 
                                end
                                print("placing back drawn_c : ", drawn_c)
                                G.deck:emplace(drawn_c)
                                play_sound('card1')
                                return true
                            end
                        }))
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            print("shuffle")
                            G.deck:shuffle('mulligan')
                            return true
                        end
                    }))
                end
            }
        end

        if context.discard and not context.blueprint 
        -- and G.GAME.current_round.discards_used <= 0 
        then
            print("Test Discard")
            return {
                func = function ()
                    local dcard = #G.discard.cards
                    print("#G.discard.cards : ", #G.discard.cards)
                    for i = dcard, 1, -1 do
                        G.E_MANAGER:add_event(Event({
                            function ()
                                local drawn_c = G.discard:remove_card()
                                if not drawn_c then 
                                    print("nothing to place back")
                                    return true 
                                end
                                print("placing back drawn_c : ", drawn_c)
                                G.deck:emplace(drawn_c)
                                play_sound('card1')
                                return true
                            end
                        })) 
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            print("shuffle")
                            G.deck:shuffle('mulligan')
                            return true
                        end
                    }))
                end
            }
        end
    end
}

