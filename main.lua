--#region Atlases

SMODS.Atlas {
    key = 'wjokers',
    path = 'wjokers.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'others',
    path = 'others.png',
    px = 71,
    py = 95
}
--#endregion 

--#region File Loading

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
local decks_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

for _, file in ipairs(decks_src) do
    assert(SMODS.load_file("src/backs/" .. file))()
end

--#endregion