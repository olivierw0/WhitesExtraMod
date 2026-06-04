SMODS.Back{
	key = "belote",
	atlas = "others",
	pos = { x = 0, y = 0 },

    config = {play_limit = 4, discard_limit = 4},
    initial_deck ={
        exclude = true,
        Ranks = {'2','3','4','5','6'}
    },

    apply = function (self, back)
        G.GAME.banned_keys["bl_psychic"] = true
        G.GAME.banned_keys["c_earth"] = true
        G.GAME.banned_keys["c_planet_x"] = true
        G.GAME.banned_keys["c_ceres"] = true
        G.GAME.banned_keys["c_eris"] = true
        
--     While I don't know how to get perma four fingers
        G.GAME.banned_keys["c_jupiter"] = true
        G.GAME.banned_keys["c_saturn"] = true
        G.GAME.banned_keys["c_neptune"] = true
--     G.GAME.banned_keys["j_four_fingers"] = true

        G.E_MANAGER:add_event(Event({
            func = function ()
                SMODS.change_play_limit(-1)
                SMODS.change_discard_limit(-1)
                return true
            end
        }))
    end
}