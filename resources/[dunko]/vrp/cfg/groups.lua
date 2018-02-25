
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)
-- whitelist group for police, emergency and president jobs / add player to this group and user can view the job selection / search in the map

cfg.groups = {

-- # STAFF

	["superadmin"] = {
		_config = {onspawn = function(player) vRPclient.notify(player,{"You are superadmin."}) end},
		"player.group.add",
		"player.group.remove",
		"player.givemoney",
		"player.giveitem"
	},

	["admin"] = {
		"admin.tickets",
		"admin.announce",
		"admin.menu",
		"admin.easy_unjail",
		"admin.spikes",
		-- "admin.godmode",
		"admin.spawnveh",
		"admin.deleteveh",
		"player.blips",
		"player.tptowaypoint",
		"player.list",
		"player.whitelist",
		"player.unwhitelist",
		"player.kick",
		"player.ban",
		"player.unban",
		"player.noclip",
		"player.custom_emote",
		"player.custom_sound",
		"player.display_custom",
		"player.coords",
		"player.tptome",
		"emergency.revive",
		"emergency.shop",
		"player.tpto"
	},

--	["god"] = {
--		"admin.god" -- reset survivals/health periodically
--	},

	["recruiter"] = {
		"player.list",
		"player.group.add",
		"player.group.remove",
		"player.whitelist",
		"player.unwhitelist"
	},

	["mod"] = {
	"admin.tickets",
	"admin.announce",
	"player.list",
	"player.kick",
	"player.coords",
	"player.tptome",
	"emergency.revive",
	"emergency.shop",
	"player.tpto"
	},

-- moderator=president / president is guy from the server give a player group cop ems moderator when admin is offline / sallary : $10.000
	["moderator"] = {
		"president.whitelisted"
	},

-- # USER
-- the group user is auto added to all logged players

	["user"] = {
		"player.phone",
		"player.calladmin",
		"player.fix_haircut",
		"player.check",
		--"mugger.mug",
		"police.askid",
		"police.store_weapons",
		"player.skip_coma",
		"player.store_money",
		"player.check",
		"player.loot",
		"player.player_menu",
		"player.userlist",
		"police.seizable",	-- can be seized
		"user.paycheck"
	},

-- # POLICE JOBS

	["cop"] = {
		"cop.whitelisted"
	},

	["Recruta"] = {
		_config = { gtype = "job",
			onjoin = function(player) vRPclient.setCop(player,{true}) end,
			onspawn = function(player) vRPclient.setCop(player,{true}) end,
			onleave = function(player) vRPclient.setCop(player,{false}) end
		},
		"police.cloakroom",
		"police.putinveh",
		"police.getoutveh",
		"police.service",
		"police.seize.weapons",
		"police.drag",
		"police.easy_cuff",
		"police.easy_fine",
		"police.easy_jail",
		"police.easy_unjail",
		"police.spikes",
		"police.menu",
		"police.check",
		"toggle.service",
		"police.freeze",
		"police.announce",
		-- "-police.store_weapons",
		"-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
		"Cadet.vehicle",
		"police.loadshop",
		"cop.whitelisted",
		"Cadet.paycheck",
		"police.menu_interaction",
		"police.mission"
	},

	["Policia Civil"] = {  
		_config = { 
			gtype = "job",
			onjoin = function(player) vRPclient.setCop(player,{true}) end,
			onspawn = function(player) vRPclient.setCop(player,{true}) end,
			onleave = function(player) vRPclient.setCop(player,{true}) end
		},
		"Detective.cloakroom",
		"police.pc",
		--"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		--"police.jail",
		--"police.fine",
		"police.drag",
		"police.easy_cuff",
		"police.easy_fine",
		"police.easy_jail",
		"police.easy_unjail",
		"police.spikes",
		"police.menu",
		"police.check",
		"toggle.service",
		"police.freeze",
		"police.announce",
		-- "-police.store_weapons",
		"-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.loadshop",
		"cop.whitelisted",
		"emergency.market",
		"emergency.revive",
		"emergency.shop",
		--"player.list",
		"Detective.paycheck",
		"police.menu_interaction",
		"player.blips",
		"police.mission"
	},

	["Policia Militar"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player) vRPclient.setCop(player,{true}) end,
			onspawn = function(player) vRPclient.setCop(player,{true}) end,
			onleave = function(player) vRPclient.setCop(player,{true}) end
		},
		"Officer.cloakroom",
		"police.pc",
		--"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.drag",
		"police.easy_cuff",
		"police.easy_fine",
		"police.easy_jail",
		"police.easy_unjail",
		"police.spikes",
		"police.menu",
		"police.check",
		"toggle.service",
		"police.freeze",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		--"police.jail",
		--"police.fine",
		"police.announce",
		-- "-police.store_weapons",
		"-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.loadshop",
		"cop.whitelisted",
		"emergency.market",
		"emergency.revive",
		"emergency.shop",
		--"player.list",
		"police.paycheck",
		"police.mission",
		"player.blips",
		"police.menu_interaction"
	},

	["Chefe da Policia"] = {
		_config = { gtype = "job",
			onjoin = function(player) vRPclient.setCop(player,{true}) end,
			onspawn = function(player) vRPclient.setCop(player,{true}) end,
			onleave = function(player) vRPclient.setCop(player,{false}) end
		},
		"Chief.cloakroom",
		"police.pc",
		--"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.service",
		"police.drag",
		"police.easy_cuff",
		"police.easy_fine",
		"police.easy_jail",
		"police.easy_unjail",
		"police.spikes",
		"police.menu",
		"police.check",
		"toggle.service",
		"police.freeze",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		--"police.jail",
		--"police.fine",
		"police.announce",
		--"-police.store_weapons",
		"-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.loadshop",
		"emergency.market",
		"emergency.revive",
		"emergency.shop",
		"cop.whitelisted",
		"Chief.paycheck",
		"police.menu_interaction",
		"police.mission"
	},

	["BOPE"] = {
		_config = { gtype = "job",
			onjoin = function(player) vRPclient.setCop(player,{true}) end,
			onspawn = function(player) vRPclient.setCop(player,{true}) end,
			onleave = function(player) vRPclient.setCop(player,{false}) end
		},
		"SWAT.cloakroom",
		"police.pc",
		--"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		--"police.jail",
		"police.drag",
		"police.easy_cuff",
		"police.easy_fine",
		"police.easy_jail",
		"police.easy_unjail",
		"police.spikes",
		"police.menu",
		"police.check",
		"toggle.service",
		"police.freeze",
		"police.announce",
		-- "-police.store_weapons",
		"-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.loadshop",
		"emergency.market",
		"emergency.revive",
		"emergency.shop",
		"cop.whitelisted",
		"SWAT.paycheck",
		"police.menu_interaction",
		"police.mission"
	},

-- # EMS JOBS

	["ems"] = {  
		"ems.whitelisted"
	},

	["Chefe do SAMU"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Chefe do SAMU."}) end
		},
		"emergency.revive",
		"police.pc",
		--"police.wanted",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emscheck.revive",
		"emergency.vehicle",
		"emergency.market",
		"ems.whitelisted",
		"ems.loadshop",
		--"player.list",
		"police.menu_interaction",
		"emsChief.paycheck",
		"player.blips",
		"ems.mission"
	},

	["Paramedico do SAMU"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Paramedico do SAMU."}) end
		},
		"emergency.revive",
		"police.pc",
		--"police.wanted",
		"emergency.shop",
		"emergency.service",
		"emscheck.revive",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"ems.whitelisted",
		"ems.loadshop",
		--"player.list",
		"police.menu_interaction",
		"emsMedic.paycheck",
		"player.blips",
		"ems.mission"
	},

-- # LAW JOBS

	["Juiz"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Juiz."}) end
		},
		"judge.paycheck",
		"Judge.whitelisted"
	},

	["Advogado"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Advogado."}) end
		},
		"Lawyer.vehicle",
		"Lawyer.whitelisted",
		"Lawyer.cloakroom",
		"Lawyer.paycheck"
	},

-- # JOBS

	["Pescador"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Pescador."}) end
		},
		"mission.delivery.fish",
		"fisher.service",
		"fisher.vehicle"
	},

	["Piloto de Cargueiro"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Piloto de Aviao Cargueiro."}) end
		},
		"mission.pilot.cargo",
		"pilot.vehicle",
		"pilot.paycheck"
	},

	["Piloto de Aviao"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Piloto de Aviao."}) end
		},
		"airlines.service",
		"air.vehicle",
		"air.paycheck"
	},

	["Transporte Medico"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Transportador de Ervas Medicinais."}) end
		},
		"mission.delivery.medical",
		"medical.service",
		"medical.vehicle"
	},

	["Mecanico"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Mecanico."}) end
		},
		"vehicle.repair",
		"vehicle.replace",
		"repair.service",
		"mission.repair.satellite_dishes",
		"mission.repair.wind_turbines",
		"repair.vehicle",
		"repair.market",
		"repair.paycheck"
	},

	["UBER"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Mecanico (Pressione DEL para Iniciar Missoes)."}) end
		},
		"uber.service",
		"uber.vehicle",
		"uber.mission",
		"uber.paycheck"
	},

	["Delivery"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Entregador (Delivery)."}) end
		},
		"mission.delivery.food",
		"delivery.vehicle",
		"delivery.paycheck"
	},

	["Coletor de Lixo"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Lixeiro."}) end
		},
		"mission.collect.trash", -- mission permission
		"trash.vehicle", -- garage permission
		"trash.paycheck" -- paycheck permission
	},

	["Transporte de Valores"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta empregado como Motorista de Carro-Forte."}) end
		},
		"mission.bankdriver.moneybank",
		"mission.bankdriver.moneybank2",
		"bankdriver.vehicle",
		"bankdriver.paycheck",
		"bankdriver.money"
	},

-- # ILLEGAL JOBS

	["Contrabandista de Armas"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta trabalhando como Contrabandista de Armas."}) end
		},
		"mission.weapons.smuggler",
		"smuggler.service"
	},

	["Falsificador"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta trabalhando como Falsificador, agora consiga alguns cartoes de credito dos hackers!"}) end
		},
		"fraud.credit_cards",
		"forger.mission"
	},

	["Traficante de Drogas"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta trabalhando como Traficante de Drogas."}) end
		},
		"mission.drugseller.weed",
		"drugseller.market",
		"harvest.weed"
	},

	["Hacker"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta trabalhando como Hacker."}) end
		},
		"mission.hacker.information",
		"hacker.hack",
		"hacker.credit_cards"
	},

-- # OTHERS JOBS

	["Vendedor de Carros Exoticos"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta trabalhando como Vendedor de Carros Exoticos."}) end
		},
		"exotic.whitelisted",
		"exotic.vehicle",
		"player.group.add",
		"player.group.remove"
		--"player.list"
	},
	["Comprador"] = {  
		"exotic.vehicle"
	},

--	["Santa"] = {
--		_config = { gtype = "job",
--			onspawn = function(player) vRPclient.notify(player,{"You are Santa, ho ho ho."}) end
--		},
--		"mission.santa", -- What mission Santa has
--		"santa.vehicle", -- Access to his garage
--		"santa.paycheck", -- How much santa gets paid per 15 mins
--		"santa.cloakroom", -- Santa's cloakroom
--		"harvest.presents" -- What he gathers (item transformers.lua)
--	},

--	["Gunrunning"] = {
--		_config = { gtype = "job",
--			onspawn = function(player) vRPclient.notify(player,{"Coming soon, Please wait!"}) end
--		}
--	},

-- # Unemployed

	["Desempregado"] = {
		_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Voce esta desempregado, va ate a prefeitura para conseguir um emprego!"}) end
		},
		"citizen.paycheck"
	}

}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
	[1] = { -- give superadmin and admin group to the first created user on the database
		"superadmin",
		"admin",
		"recruiter"
	}
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {

	["Depto Policia Alta"] = { -- Alta Street
		_config = {x = 447.35137939453, y = -975.57592773438, z = 30.689584732056, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
		"Recruta",
		"Policia Civil",
		"Policia Militar",
		"BOPE",
		"Chefe da Policia",
		"Desempregado"
	},

	["Depto Policia Sandy"] = { -- Sandy Shores
		_config = {x = 1857.5961914063, y = 3688.8952636719, z = 34.267040252686, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
		"Recruta",
		"Policia Civil",
		"Policia Militar",
		"BOPE",
		"Chefe da Policia",
		"Desempregado"
	},

	["Depto Policia Paleto"] = { -- Paleto Bay
		_config = {x = -449.00927734375, y = 6017.1953125, z = 31.716377258301, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
		"Recruta",
		"Policia Civil",
		"Policia Militar",
		"BOPE",
		"Chefe da Policia",
		"Desempregado"
	},

	["Depto Saude"] = { -- Spawn Hospital
		_config = {x =  249.50639343262, y = -1375.0694580078, z = 39.534378051758, blipid = 351, blipcolor = 3, permissions = {"ems.whitelisted"} },
		"Chefe do SAMU",
		"Paramedico do SAMU",
		"Desempregado"
	},

	["Cargos Tribunal"] = {
		_config = {x = -59.127178192139, y = 359.25082397461, z = 113.05643463135, blipid = 351, blipcolor = 7, permissions = {"Judge.whitelisted"} },
		"Juiz",
		"Desempregado"
	},

	["Cargos Advocacia"] = {
		_config = {x = -1911.9273681641, y = -569.71649169922, z = 19.097215652466, blipid = 351, blipcolor = 7, permissions = {"Lawyer.whitelisted"} },
		"Advogado",
		"Desempregado"
	},

	["Lista de Empregos"] = {
		_config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
		"UBER",
		"Mecanico",
		"Delivery",
		"Transporte de Valores",
		"Pescador",
		"Transporte Medico",
		"Desempregado"
	},

	["Piloto de Aviao"] = {
		_config = {x = -759.6591796875, y = -1515.3978271484, z = 4.9768991470337, blipid =  307, blipcolor = 4},
		"Piloto de Aviao",
		"Desempregado"
	},

	["Piloto de Cargueiro"] = {
		_config = {x = -928.89624023438, y = -2937.396484375, z = 13.945074081421,blipid = 472, blipcolor = 4},
		"Piloto de Cargueiro",
		"Desempregado"
	},

	["Emprego de Coletor"] = {
		_config = {x = 750.05029296875, y = -1402.9224853516, z = 26.549806594849,blipid = 318, blipcolor = 2}, -- Job starts here
		"Coletor de Lixo",
		"Desempregado"
	},

	["Trabalho Ilegal - Trafico"] = {
		_config = {x = 1865.1586914063, y = 3749.4343261719, z = 33.046268463135, blipid = 277, blipcolor = 4},
		"Traficante de Drogas",
		"Desempregado"
	},

	["Trabalho Ilegal - Contrabando"] = {
		_config = {x = 283.10546875, y = 6788.7104492188, z = 15.695198059082, blipid =  150, blipcolor = 4},
		"Contrabandista de Armas",
		"Desempregado"
	},

	["Trabalho Ilegal - Falsificacao"] = {
		_config = {x = 388.61703491211, y = 3587.1179199219, z = 33.292263031006, blipid = 472, blipcolor = 4},
		"Falsificador",
		"Desempregado"
	},

	["Trabalho Ilegal - Hacker"] = {
		_config = {x = 705.682189941406, y = -966.919067382813, z = 30.3953418731689, blipid = 472, blipcolor = 4},
		"Hacker",
		"Desempregado"
	}

}

return cfg