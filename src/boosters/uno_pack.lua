-- Uno Booster Packs
SMODS.Booster ({
    key = "uno_normal",
    atlas = 'others',
    kind = 'whiteem_Uno',
    group_key = "p_uno_pack",
    pos = { x = 2, y = 1 },
    config = { extra = 2, choose = 1 },

    cost = 5,
    weight = 0.75,
    draw_hand = true,

    discovered = true,
    unlocked = true,

    loc_txt = {
        ['name']='Uno Pack',
        ['text']={
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2# {C:mult}Uno{} cards to",
            "be used immediately",
        },
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
            }
        }
    end,
    
    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.BLACK, contrast = 1}
    end,
    
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.RED, lighten(G.C.GREEN, 0.2), lighten(G.C.YELLOW, 0.2), lighten(G.C.BLUE, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    
    create_card = function(self, card, i)
        return create_card('Uno', G.pack_card,nil,nil,true,true,nil,'whiteem_Uno')
    end,
})


-- Uno Jumbo
SMODS.Booster ({
    key = "uno_jumbo",
    atlas = 'others',
    kind = 'whiteem_Uno',
    group_key = "p_uno_pack",
    pos = { x = 3, y = 1 },
    config = { extra = 3, choose = 1 },

    cost = 7,
    weight = 0.5,
    draw_hand = true,

    discovered = true,
    unlocked = true,

    loc_txt = {
        ['name']='Jumbo Uno Pack',
        ['text']={
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2# {C:mult}Uno{} cards to",
            "be used immediately",
        },
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
            }
        }
    end,
    
    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.BLACK, contrast = 1}
    end,
    
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.RED, lighten(G.C.GREEN, 0.2), lighten(G.C.YELLOW, 0.2), lighten(G.C.BLUE, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    
    create_card = function(self, card, i)
        return create_card('Uno', G.pack_card,nil,nil,true,true,nil,'whiteem_Uno')
    end,
})


-- Uno Mega
SMODS.Booster ({
    key = "uno_mega",
    atlas = 'others',
    kind = 'whiteem_Uno',
    group_key = "p_uno_pack",
    pos = { x = 4, y = 1 },
    config = { extra = 4, choose = 2 },

    cost = 9,
    weight = 0.2,
    draw_hand = true,

    discovered = true,
    unlocked = true,

    loc_txt = {
        ['name']='Mega Uno Pack',
        ['text']={
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2# {C:mult}Uno{} cards to",
            "be used immediately",
        },
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
            }
        }
    end,
    
    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.BLACK, contrast = 1}
    end,
    
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.RED, lighten(G.C.GREEN, 0.2), lighten(G.C.YELLOW, 0.2), lighten(G.C.BLUE, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    
    create_card = function(self, card, i)
        return create_card('Uno', G.pack_card,nil,nil,true,true,nil,'whiteem_Uno')
    end,
})

    