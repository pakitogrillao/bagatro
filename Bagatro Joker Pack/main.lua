SMODS.Atlas{
    key = 'Jokers',
    path = 'Markilier.png',
    px = 71,
    py = 95
}
 --JOKERS JOKERS JOKERS--
 --JOKERS JOKERS--
 --JOKERS--


-- Markilier x87 mult --
SMODS.Joker{
    key = 'Markiplier',
    loc_txt = {
        name = 'Markiplier',
        text = {
            'Was that the bite of',
            '{X:mult,C:white}X#1#{}?'
        }
    },
    atlas ='Jokers',
    pos = {x = 0, y = 0},
    rarity = 3,
    config = { extra = {
        Xmult = 87
    }},
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}}
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'Was that the bite of X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end
    end
}
-- :aga: --
SMODS.Joker{
    key = 'aga',
    loc_txt = {
        name = 'Aga',
        text = {
            '{X:chips,C:white} +#1# Chips',
            '{X:chips,C:white} X#1# Chips',
            '{X:money,C:white} +#1# $',
            '{X:mult,C:white} X#1# Mult',
            '{X:mult, C:white} +#1# Mult',
            '+#2# to all on trigger'
        }
    },
    config = {extra = {
        chips = 1
    }},
    rarity = 4,
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    loc_vars = function (self, info_queue, center)
        return{vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
	if context.joker_main then
		return {
			chips = card.ability.extra.chips
		}
	end
end,
    pools = {
        ["aga"] = true
    }
}

--test--
SMODS.Joker{
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