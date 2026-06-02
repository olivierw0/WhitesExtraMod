SMODS.ConsumableType{
    key = 'uno',
    default = 'plus_two',
    primary_colour = G.C.RED,
    secondary_colour = G.C.BLACK,
    collection_rows = { 3, 4 },
    shop_rate = 0
}

SMODS.Consumable{
    key = 'plus_two',
    set = 'uno',
    pos = {x = 0, y=0},
    atlas = 'others',

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            plus = 2
        }
    },
    
    loc_txt={
        ['name'] = '+2 Card',
        ['text'] = {
            "Increase rank of",
            "a selected card by {C:attention}#1#",
        }
    },

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.plus
            }
        } 
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted == 1
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    -- SMODS.modify_rank will increment/decrement a given card's rank by a given amount
                    assert(SMODS.modify_rank(G.hand.highlighted[i], 2))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
}

SMODS.Consumable{
    key = 'reverse',
    set = 'uno',
    atlas = 'others',
    pos = {x = 0, y=0},

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            minus = 1
        }
    },
    
    loc_txt={
        ['name'] = 'Reverse Card',
        ['text'] = {
            "Decrease the rank of",
            "a selected card by {C:attention}#1#",
        }
    },

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.minus
            }
        } 
    end
}

SMODS.Consumable{
    key = 'skip',
    set = 'uno',
    atlas = 'others',
    pos = {x = 0, y=0},
    
    unlocked = true,
    discovered = true,
    
    loc_txt={
        ['name'] = 'Skip Card',
        ['text'] = {
            "Gains a random",
            "{C:attention}Skip Tag{}",
        }
    },

    can_use = function(self, card)
        return true
    end,

    use = function (self, card, area, copier)
        local counter = 0
        local random_key = nil
        
        for key, _ in pairs(G.P_TAGS) do
            counter = counter + 1
            -- 1 in counter chance to pick the current key
            if math.random(1, counter) == 1 then
                random_key = key
            end
        end

        add_tag({key = random_key})
        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
    end
}