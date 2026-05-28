return{
    descriptions = {
        Joker = {
            j_whiteem_jungle = {
                name = 'Welcome to the Jungle',
                text = {
                    "Played {C:attention}Wild Cards{}",
                    "gives {X:mult,C:white} X#1# {} Mult",
                    "when scored",
                }
            },
            j_whiteem_hardrock = {
                name = 'Hard Rock',
                text = {
                    "Played {C:attention}Stone Cards{}",
                    "gives {X:chips,C:white} X#1# {} Chips ",
                    "when scored",
                }
            }, 
            j_whiteem_iron = {
                name = 'Iron and Coal Joker',
                text = {
                    "Played {C:attention}Steel{} cards",
                    "gives {C:chips}+#2#{} Chips",
                    "and {C:mult}+#1#{} Mult",
                    "when scored",
                }
            }, 
            j_whiteem_molten = {
                name = 'Molten Joker',
                text = {
                    "This Joker gives {C:money}$#1#{} per scoring",
                    "{C:attention}Steel{} or {C:attention}Gold Card{} played",
                    "transform into {C:attention}Stone Card{} after",
                }
            }, 
            j_whiteem_rainbow = {
                name = "ROYGBIV",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand cointains 5 {C:attention}Wild Cards{}",
                }
            }, 
            j_whiteem_jackpot = {
                name = "Jackpot",
                text = {
                    "{C:green}#3# in #4#{} chance to gain",
                    "{C:money}$#1#{} and {X:mult,C:white} X#2# {} Mult when",
                    "scoring three {C:attention}7s{}",
                }
            }, 
            j_whiteem_flower_seeds = {
                name = "Flower Seeds",
                text = {
                    "This Joker gains",
                    "{C:mult}+#1#{} Mult when any",
                    "card changes {C:attention}suit{}",
                    "{C:inactive}(Currently {C:mult}#2#{C:inactive} Mult)",
                }
            }
        },

        Back = {
            b_whiteem_belote = {
                name = "Bridge Deck",
                text = {
                    "Start run with",
                    "32 cards deck",
                    "4 cards {C:attention}selection{}",
                }
            },
        }

    }
}