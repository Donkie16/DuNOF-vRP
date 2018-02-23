
-- this file configure the cloakrooms on the map

local cfg = {}

-- prepare surgeries customizations
local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
-- Recruta
local cop_male = { model = "s_m_y_ranger_01"}
--local cop_female = { model = "s_f_y_cop_01"}
-- Policia Civil
local detective_male = { model = "s_m_m_CIASec_01"}
-- Policia Militar
local officer_male = { model = "s_m_y_ranger_01"}
-- Chefe da Policia
local chief_male = {model = "s_m_m_ciasec_01"}
-- BOPE
local fbi_male = { model = "s_m_y_swat_01" }
-- SAMU
local emergency_male = { model = "s_m_m_paramedic_01" }
local emergency_female = { model = "s_f_y_paramedic_01" }


--local surgery_male = { model = "mp_m_freemode_01" }
--local surgery_female = { model = "mp_f_freemode_01" }
--local emergency_male = { model = "s_m_m_paramedic_01" }
--local emergency_female = { model = "s_f_y_paramedic_01" }
--local fbi_male = { model = "s_m_y_swat_01" }
--local sheriff_male = { model = "s_m_y_sheriff_01"}
--local sheriff_female = { model = "s_f_y_ranger_01"}
--local hway_male = { model = "s_m_y_hwaycop_01"}
--local cop_male = { model = "s_m_y_cop_01"}
--local cop_female = { model = "s_f_y_cop_01"}
--local detective_male = { model = "s_m_m_CIASec_01"}
--local officer_male = { model = "s_m_y_cop_01"}
--local bounty_male = { model = "s_m_y_BlackOps_01"}
--local captain_male = { model = "s_m_y_fibcop_01"}
--local lieutenant_male = { model = "s_m_m_Armoured_02"}
--local sergeant_male = { model = "s_m_y_Ranger_01"}
--local deputy_male = { model = "s_m_y_ranger_01"}
--local chief_male = {model = "s_m_m_ciasec_01"}
--local santa = {model = "Santaclaus"}

--s_m_m_paramedic_01
--s_f_y_scrubs_01
--mp_m_freemode_01
--mp_f_freemode_01


for i=0,19 do
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {

  ["Cirurgia"] = {
    _config = { not_uniform = true },
    ["Masculino"] = surgery_male,
    ["Feminino"] = surgery_female
  },

  ["Recruta"] = {
    _config = { permissions = {"Officer.cloakroom"} },
    ["Masculino"] = cop_male
--    ["Feminino"] = cop_female
  },

  ["Policia Civil"] = {
    _config = { permissions = {"Detective.cloakroom"} },
    ["Detetive"] = detective_male
  },

  ["Policia Militar"] = {
    _config = { permissions = {"Officer.cloakroom"} },
    ["Masculino"] = officer_male
--    ["Feminino"] = cop_female
  },

  ["BOPE"] = {
    _config = { permissions = {"SWAT.cloakroom"} },
    ["Masculino"] = fbi_male,
  },

  ["Chefe da Policia"] = {
    _config = { permissions = {"Chief.cloakroom"} },
    ["Masculino"] = chief_male
  },

  ["SAMU"] = {
    _config = { permissions = {"emergency.cloakroom"} },
    ["Masculino"] = emergency_male,
    ["Feminino"] = emergency_female
  },

  ["Advogado"] = {
    _config = { permissions = {"Lawyer.cloakroom"} },
    ["Masculino"] = {
      [3] = {1,0},
      [4] = {10,0},
      [6] = {10,0},
      [8] = {4,0},
      [11] = {10,0},
      ["p2"] = {-1,0}       
    },
    ["Feminino"] = {
      [3] = {0,0},
      [4] = {37,0},
      [6] = {13,0},
      [8] = {21,1},
      [11] = {24,3},
      ["p2"] = {-1,0}
    }
  }

-- ["Santa"] = {
-- _config = { permissions = {"santa.cloakroom"} },
-- ["Santa Outfit"] = santa
-- },

}

cfg.cloakrooms = {

{"Cirurgia",1849.7425,3686.5759,34.2670},----first spawn change skin
{"Cirurgia",75.3451766967773,-1392.86596679688,29.3761329650879},---skinsshops
{"Cirurgia",-700.089477539063,-151.570571899414,37.4151458740234},
{"Cirurgia",-170.416717529297,-296.563873291016,39.7332878112793},
{"Cirurgia",425.61181640625,-806.519897460938,29.4911422729492},
{"Cirurgia",-822.166687011719,-1073.58020019531,11.3281087875366},
{"Cirurgia",-1186.25744628906,-771.20166015625,17.3308639526367},
{"Cirurgia",-1450.98388671875,-238.164260864258,49.8105850219727},
{"Cirurgia",4.44537162780762,6512.244140625,31.8778476715088},
{"Cirurgia",1693.91735839844,4822.66162109375,42.0631141662598},
{"Cirurgia",118.071769714355,-224.893646240234,54.5578384399414},
{"Cirurgia",620.459167480469,2766.82641601563,42.0881042480469},
{"Cirurgia",1196.89221191406,2710.220703125,38.2226066589355},
{"Cirurgia",-3178.01000976563,1043.21044921875,20.8632164001465},
{"Cirurgia",-1101.15161132813,2710.8203125,19.1078643798828},

{"Recruta", 459.01037597656,-992.32800292969,30.689575195313},
{"Recruta", 1848.2177734375,3689.5593261719,34.267040252686}, -- sandy shores
{"Recruta", -448.53857421875,6009.2690429688,31.716375350952}, -- paleto
{"Policia Militar", 459.01037597656,-992.32800292969,30.689575195313},
{"Policia Militar", 1848.2177734375,3689.5593261719,34.267040252686}, -- sandy shores
{"Policia Militar", -448.53857421875,6009.2690429688,31.716375350952}, -- paleto
{"Chefe da Policia", 459.01037597656,-992.32800292969,30.689575195313},
{"BOPE", 459.01037597656,-992.32800292969,30.689575195313},
{"BOPE", 1848.2177734375,3689.5593261719,34.267040252686}, -- sandy shores
{"BOPE", -448.53857421875,6009.2690429688,31.716375350952}, -- paleto

{"SAMU",244.1099395752,-1382.8720703125,39.534328460693},

{"Advogado",105.48087310791,-1088.82177734375,29.3024787902832}

-- {"Santa",-1373.0778808594,-2677.6694335938,13.944942474365} -- Santa's Cloakroom (Disabled)

}

return cfg
