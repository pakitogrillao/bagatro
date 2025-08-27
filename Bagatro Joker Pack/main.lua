SMODS.Atlas{
    key = 'Jokers',
    path = 'Markilier.png',
    px = 71,
    py = 95,

SMODS.Atlas {
    key = "modicon",
    path = "misc/modIcon.png",
    px = 32,
    py = 32
}:register(),

SMODS.ObjectType {
    key = 'agapool',
    cards = {
        ['aga_aga'] = true,
        ['aga_mitagasis'] = true,
        ['aga_test'] = true
    }
},
SMODS.Sound{

    key = 'Bo87',
    path = 'Bo87.ogg'
}
}
 --JOKERS JOKERS JOKERS--
 --JOKERS JOKERS--
 --JOKERS--



SMODS.Joker{-- Markilier --
    key = 'Markiplier',
    loc_txt = {
        name = {
            '{s:0.60} Hello everyone my name is',
            '{s:1.25, C:mult} Multiplier'
        },
        text = {
            'Was that the bite of',
            '{X:mult,C:white}+#1#{}?'
        }
    },
    
    atlas ='Jokers',
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 7,
    config = { extra = {
        mult = 87
    }},
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                card = card,
                mult = card.ability.extra.mult,
                message = 'Was that the bite of +' .. card.ability.extra.mult,
                colour = G.C.MULT,
                play_sound('aga_Bo87', 1.15, 0.55)
            }
        end
    end
}

SMODS.Joker{-- :aga: --
    key = 'agalegendary',
    loc_txt = {
        name = 'Aga',
        text = {
            '{X:chips,C:white} +#1# Chips',
            '{X:chips,C:white} X#1# Chips',
            '{X:money,C:white} +#1#$',
            '{X:mult,C:white} X#1# Mult',
            '{X:mult, C:white} +#1# Mult',
            '+1 to all on trigger'
        }
    },
    config = {extra = {
        chips = 0,
        mult = 0,
        dollars = 0,
        Xmult = 0,
        xchips = 0,
        chip_gain = 1,
        mult_gain = 1,
        dollars_gain = 1,
        Xmult_gain = 1,
        xchips_gain = 1

    }},
    rarity = 4,
    soul_pos = {x=1,y=1},
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    loc_vars = function (self, info_queue, center)
        return{vars = {center.ability.extra.chips, center.ability.extra.mult,}}
    end,
    calculate = function(self, card, context)
	if context.joker_main then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
        card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_gain
		return {
            message = 'Upgraded!',
			chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
            dollars = card.ability.extra.dollars,
            Xmult = card.ability.extra.Xmult,
            xchips = card.ability.extra.xchips
		}
	end
end,
}


SMODS.Joker{ -- placeholder--
    key = 'test',
    loc_txt = {
        name = 'test',
        text = {
        '{X:mult,C:white} +#1# {} Mult',
        }
    },
    atlas = 'Jokers',
    pos = {x=0, y=1}
}

SMODS.Joker { -- Mitagasis --
    key = 'mitagasis',
    loc_txt = {
        name = 'Mitagasis',
        text = {
            '{X:chips,C:white} X#1# {} Chips for each other',
            'Mitagasis you own. (Currently {X:chips,C:white} X#2#)',
            'Duplicates itself at the end of round.'
        }
    },

    config = {extra = {
        xchips_per = 0.1,
        xchips = 1,
        numberofmitagasis = #SMODS.find_card('j_aga_mitagasis')
    },
    },
    loc_vars = function (self, info_queue, center)
        return{vars = {center.ability.extra.xchips_per, center.ability.extra.xchips}}       
    end,
    atlas = 'Jokers',
    pos = {x=2,y=0},
    rarity = 2,
    calculate = function (self, card, context)
        card.ability.extra.xchips = 1 + card.ability.extra.xchips_per * #SMODS.find_card('j_aga_mitagasis')
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips + (card.ability.extra.xchips_per * #SMODS.find_card('j_aga_mitagasis'))
            }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            G.E_MANAGER:add_event(Event({
                func = function ()
                    local c = copy_card(card)
                    c:add_to_deck()
                    G.jokers:emplace(c)
                    return true
                end,
            }))
            return {
                message = ('It spreads.'),
            }
        end
    end
}

SMODS.Joker { -- agan --
    key = 'agan',
    loc_txt = {
        name = 'Agan',
        text = {
            'When sold, destroys all jokers',
            'and wins the current blind.'
        }
    },
    calculate = function (self, card, context)
        if context.selling_card then
            for i = #G.jokers.cards, 1, -1 do
                local j = G.jokers.cards[i]
                if j ~= card then
                    j:start_dissolve()
                end
            end
            if G.GAME and G.GAME.blind then
                G.GAME.blind.chips = 0
                G.STATE = G.STATES.ROUND_EVAL
                end_round()
            end
        end
    end
}


--BLINDS BLINDS BLINDS--
--BLINDS BLINDS-- 
--BLINDS--

SMODS.Atlas{
    key = 'Blind_chips',
    path = 'Bosschips.png',
    px = 96,
    py = 96
}

SMODS.Blind{
    key = 'aga',
    loc_txt = {
        name = 'Finagal Boss',
        text = {'All non-aga jokers are debuffed'}
    },
    atlas = 'Blind_chips',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 2,
    pos = {x=0, y=0},
    discovered = true
}