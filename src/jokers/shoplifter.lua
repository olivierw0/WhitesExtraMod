SMODS.Joker{
    key='shoplifting',
    atlas='wjokers',
    pos= { x = 0, y = 4 },

    config = {
        extra = {
            percent = -50
        }
    },

    loc_txt = {
        ['name'] = "Shopping Display",
        ['text'] = {
            "{C:attention}+1 Shop{}, {C:attention}Booster Pack{}",
            "and {C:attention}Voucher Slot{} in Shop",
            "but everything is {C:money}50%{} more expensive"
        }
    },

    rarity = 2,
    cost = 6,

    blueprint_compat = false,

    unlocked = true,
    discovered = true, 

    add_to_deck = function(self, card, from_debuff)
        change_shop_size(1)
        SMODS.change_voucher_limit(1)
        SMODS.change_booster_limit(1)
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.percent
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-1)
        SMODS.change_voucher_limit(-1)
        SMODS.change_booster_limit(-1)

        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.percent
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
}