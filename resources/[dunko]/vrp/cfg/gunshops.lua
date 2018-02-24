
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {

    ["Armas Civis"] = {
        _config = {blipid=110,blipcolor=1},

        -- # WHITE GUNS
        ["WEAPON_BOTTLE"] = {"Garrafa",500,0,""},
        ["WEAPON_BAT"] = {"Taco",1000,0,""},
        ["WEAPON_KNUCKLE"] = {"Soco-ingles",1000,0,""},
        ["WEAPON_KNIFE"] = {"Faca",5000,0,""},
        --["WEAPON_DAGGER"] = {"Dagger",100,0,""},
        --["WEAPON_HAMMER"] = {"Hammer",50,0,""},
        --["WEAPON_HATCHET"] = {"Hatchet",100,0,""},
        --["WEAPON_CROWBAR"] = {"Crowwbar",70,0,""},
        --["WEAPON_GOLFCLUB"] = {"Golf club",30,0,""},
        --["WEAPON_SWITCHBLADE"] = {"Blade",100,0,""},
        --["WEAPON_MACHETE"] = {"Machete",150,0,""},

        -- # TOOLS
        ["WEAPON_FLASHLIGHT"] = {"Lanterna",200,0,""},
        ["WEAPON_FLARE"] = {"Sinalizador",1000,1000,""},
        ["WEAPON_FLAREGUN"] = {"Pistola Sinalizador",5000,0,""},
        ["WEAPON_FIREWORK"] = {"Fogos de Artificio",2000,0,""},
        --["WEAPON_PETROLCAN"] = {"Petrol",25000,0,""},
        --["WEAPON_SNOWBALL"] = {"SnowBall",3000000,0,""},

        -- # PISTOLS
        ["WEAPON_SNSPISTOL"] = {"Pistola Fajuta",25000,2,""},
        ["WEAPON_PISTOL"] = {"Pistola",50000,2,""}
        --["WEAPON_VINTAGEPISTOL"] = {"Vintage Pistol",2500,2,""},
        --["WEAPON_MARKSMANPISTOL"] = {"Marksman Pistol",1500,2,""},
        --["WEAPON_COMBATPISTOL"] = {"Combat Pistol",5000,2,""},
        --["WEAPON_HEAVYPISTOL"] = {"Heavy Pistol",5000,2,""},
        --["WEAPON_APPISTOL"] = {"Ap Pistol",7500,2,""},

        -- # OLD GUNS
        --["WEAPON_MUSKET"] = {"Musket",50000,0,""},

        -- # SHOTGUNS
        --["WEAPON_SAWNOFFSHOTGUN"] = {"Saw Shotgun",30000,65,""},
        --["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",7000,20,""},
        --["WEAPON_BULLPUPSHOTGUN"] = {"BullUp Shotgun",10000,30,""},
        --["WEAPON_HEAVYSHOTGUN"] = {"Heavy Shotgun",50000,50,""},
        --["WEAPON_ASSAULTSHOTGUN"] = {"Assault Shotgun",150000,50,""},

        -- # SMG
        --["WEAPON_MICROSMG"] = {"Mini SMG",5000,5,""},
        --["WEAPON_SMG"] = {"SMG",5000,5,""},
        --["WEAPON_ASSAULTSMG"] = {"Assault SMG",5500,5,""},
        --["WEAPON_COMBATPDW"] = {"Combat PDW",7500,5,""},
        --["WEAPON_MACHINEPISTOL"] = {"Machine Pistol",7500,5,""},
        --["WEAPON_MARKSMANPISTOL"] = {"Marksman Pistol",1500,5,""},
        --["WEAPON_COMPACTRIFLE"] = {"Mini SMG",5500,10,""},
        --["WEAPON_GUSENBERG"] = {"Gusenberg MG",5000,5,""},

        -- # ASSAULT RIFLES

        --["WEAPON_BULLPUPRIFLE"] = {"Bullpup Rifle",50000,45,""},
        --["WEAPON_ASSAULTRIFLE"] = {"Assault Rifle",65000,50,""},
        --["WEAPON_CARBINERIFLE"] = {"Carabineri Rifle",65000,50,""},
        --["WEAPON_ADVANCEDRIFLE"] = {"Carabine",65000,50,""},
        --["WEAPON_SPECIALCARBINE"] = {"Special Carabine",65000,50,""},

        -- # HEAVY GUNS

        --["WEAPON_MG"] = {"MG",100000,75,""},
        --["WEAPON_COMBATMG"] = {"Combat MG",150000,100,""},

        -- # SNIPER RIFLES

        --["WEAPON_MARKSMANRIFLE"] = {"Marksman Rifle",100000,100,""},
        --["WEAPON_SNIPERRIFLE"] = {"Sniper Rifle",200000,75,""},
        --["WEAPON_HEAVYSNIPER"] = {"Heavy Rifle",400000,150,""},

        -- # NADES

        --["WEAPON_GRENADE"] = {"Grenade",350,350,""},
        --["WEAPON_MOLOTOV"] = {"Molotv",100,100,""},
        --["WEAPON_GRENADELAUNCHER_SMOKE"] = {"Grenade Launcher",500000,3500,""},
        --["WEAPON_SMOKEGRENADE"] = {"Smoke Grenade",50,0,""},
    },

--    ["Armas1"] = {
--        _config = {blipid=110,blipcolor=1},
--
--        -- # WHITE GUNS
--
--        ["WEAPON_BOTTLE"] = {"Garrafa",500,0,""},
--        ["WEAPON_BAT"] = {"Taco",1000,0,""},
--        ["WEAPON_KNUCKLE"] = {"Soco-ingles",1000,0,""},
--        ["WEAPON_KNIFE"] = {"Faca",5000,0,""},

        -- # TOOLS

--        ["WEAPON_FLASHLIGHT"] = {"Lanterna",200,0,""},
--        ["WEAPON_FLARE"] = {"Sinalizador",1000,1000,""},
--        ["WEAPON_FLAREGUN"] = {"Pistola Sinalizador",5000,0,""},
--        ["WEAPON_FIREWORK"] = {"Fogos de Artificio",2000,0,""},
--
--        -- # PISTOLS
--
--        ["WEAPON_SNSPISTOL"] = {"Pistola Fajuta",25000,2,""},
--        ["WEAPON_PISTOL"] = {"Pistola",50000,2,""}

--    },

-- # POLICE LOADOUTS

    ["Armas Recruta"] = {
        _config = {blipid=110,blipcolor=74, permissions = {"Cadet.loadshop"}},

        -- # TOOLS
        ["WEAPON_FLASHLIGHT"] = {"Lanterna",0,0,""},
        ["WEAPON_STUNGUN"] = {"Tazer",0,0,""},
        ["WEAPON_NIGHTSTICK"] = {"Cacetete",0,0,""},
        ["WEAPON_FLARE"] = {"Sinalizador",0,0,""},
        ["WEAPON_FLAREGUN"] = {"Pistola Sinalizador",0,0,""},
        ["WEAPON_PETROLCAN"] = {"Galao de Gasolina",0,0,""},

        -- # PISTOLS
        ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",0,0,""},

        -- # SHOTGUNS
        ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",0,0,""}

    },

    ["Armas PM"] = {
        _config = {blipid=110,blipcolor=74, permissions = {"police.loadshop"}},

        -- # TOOLS
        ["WEAPON_FLASHLIGHT"] = {"Lanterna",0,0,""},
        ["WEAPON_STUNGUN"] = {"Tazer",0,0,""},
        ["WEAPON_NIGHTSTICK"] = {"Cacetete",0,0,""},
        ["WEAPON_FLARE"] = {"Sinalizador",0,0,""},
        ["WEAPON_FLAREGUN"] = {"Pistola Sinalizador",0,0,""},
        ["WEAPON_PETROLCAN"] = {"Galao de Gasolina",0,0,""},

        -- # PISTOLS
        ["WEAPON_COMBATPISTOL"] = {"Pistola de Combate",0,0,""},

        -- # SHOTGUNS
        ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",0,0,""},

        -- # SMG
        ["WEAPON_COMBATPDW"] = {"SMG de Combate",0,0,""}

    },


    ["Armas BOPE"] = {
    _config = {blipid=110,blipcolor=74, permissions = {"SWAT.loadshop"}},

        -- # TOOLS
        ["WEAPON_FLASHLIGHT"] = {"Lanterna",0,0,""},
        ["WEAPON_STUNGUN"] = {"Tazer",0,0,""},
        ["WEAPON_NIGHTSTICK"] = {"Cacetete",0,0,""},
        ["WEAPON_FLARE"] = {"Sinalizador",0,0,""},
        ["WEAPON_FLAREGUN"] = {"Pistola Sinalizador",0,0,""},
        ["WEAPON_PETROLCAN"] = {"Galao de Gasolina",0,0,""},

        -- # PISTOLS
        ["WEAPON_COMBATPISTOL"] = {"Pistola de Combate",0,0,""},

        -- # SHOTGUNS
        ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",0,0,""},

        -- # SMG
        ["WEAPON_COMBATPDW"] = {"Submetralhadora de Combate",0,0,""},

        -- # RIFLES
        ["WEAPON_BULLPUPRIFLE"] = {"Bullpup Rifle",0,0,""},

        -- # SNIPER RIFLES
        ["WEAPON_SNIPERRIFLE"] = {"Sniper Rifle",0,0,""}

    },


    ["Armas SAMU"] = {
        _config = {blipid=446,blipcolor=74, permissions = {"ems.loadshop"}},

        -- # TOOLS
        ["WEAPON_FLASHLIGHT"] = {"Lanterna",0,0,""},
        ["WEAPON_STUNGUN"] = {"Tazer",0,0,""},
        ["WEAPON_NIGHTSTICK"] = {"Cacetete",0,0,""},
        ["WEAPON_FLARE"] = {"Sinalizador",0,0,""},
        ["WEAPON_FLAREGUN"] = {"Pistola Sinalizador",0,0,""},
        ["WEAPON_PETROLCAN"] = {"Galao de Gasolina",0,0,""}

    }

--    ["bombsticky"] = {
--        _config = {blipid=110,blipcolor=1},
--        ["WEAPON_STICKYBOMB"] = {"Sticky bomb",50000,50000,""} 
--    }

}

-- list of gunshops positions
cfg.gunshops = {

    -- # CIVIL GUN SHOP
    {"Armas Civis", 844.299, -1033.26, 28.1949},
    {"Armas Civis", -331.50210571289,6082.5063476563,31.454769134521}, -- Paleto
    --{"bombsticky", 708.847778320313,-959.231750488281,30.3953418731689},

    -- # POLICE LOADOUT
    {"Armas Recruta", 461.33551025391,-981.11071777344,30.689584732056},
    {"Armas PM", 461.33551025391,-981.11071777344,30.689584732056},--- main pd
    {"Armas PM", 1851.7342529297,3683.7416992188,34.267044067383}, -- sandy shores
    {"Armas PM", -442.724609375,6012.6293945313,31.716390609741},
    {"Armas BOPE", 461.33551025391,-981.11071777344,30.689584732056},
    --{"Bounty_Hunter", 563.62060546875,-3126.9626464844,18.768604278564},

    -- # EMS LOADOUT
    {"Armas SAMU", 232.89363098145,-1368.3338623047,39.534381866455}, -- spawn hospital
    {"Armas SAMU", 1837.8341064453,3671.3837890625,34.276763916016}, -- sandy shores
    {"Armas SAMU", -246.91954040527,6330.349609375,32.42618560791} -- paleto

}

return cfg
