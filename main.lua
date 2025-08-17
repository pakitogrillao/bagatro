-- a lot of code has been taken from other mods cause i refuse to acknowledge lua as a real coding language
-- the fuck do you mean that arrays start at 1? get the fuck out of here
-- lua is not a serious language and i hate it
local mod = SMODS.current_mod

SMODS.Atlas { key = "Joker", path = "Jokers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas { key = "Tarot", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas { key = "Voucher", path = "Vouchers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Planet", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Consumeable", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "centers", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }

SMODS.Atlas {
    key = "modicon",
    path = "misc/modIcon.png",
    px = 32,
    py = 32
}

SMODS.Language({
    key = "aga",
    label = "Aga",
    beta = true,
    button = "Aga",
    warning = { "La versión original del aga en español. :aga:" },
    path = "aga.lua",
})

SMODS.Language({
    key = "super_aga",
    label = "Super Aga",
    beta = true,
    button = "Super Aga",
    warning = { "No vas a entender nada de este. :aga:" },
    path = "super_aga.lua",
})
