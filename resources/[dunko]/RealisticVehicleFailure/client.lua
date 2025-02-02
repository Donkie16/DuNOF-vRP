------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard
--	
--	This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
--
--	https://github.com/iEns/RealisticVehicleFailure
--

local deformationMultiplier = 5.0				-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch
local weaponsDamageMultiplier = 0.01			-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
local damageFactorEngine = 8.0					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
local damageFactorBody = 5.0					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
local damageFactorPetrolTank = 44.0				-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 64
local cascadingFailureSpeedFactor = 8.0			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8
local degradingHealthSpeedFactor = 10			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving.
local degradingFailureThreshold = 800.0			-- Below this value, slow health degradation will set in
local cascadingFailureThreshold = 360.0			-- Below this value, health cascading failure will set in
local engineSafeGuard = 100.0					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.
local displayBlips = true						-- Show blips for mechanics locations


-- id=446 for wrench icon, id=72 for spraycan icon
local mechanics = {
	{name="Oficina", id=446, r=25.0, x=-337.0,  y=-135.0,  z=39.0},	-- LSC Burton
	{name="Oficina", id=446, r=25.0, x=-1155.0, y=-2007.0, z=13.0},	-- LSC by airport
	{name="Oficina", id=446, r=25.0, x=734.0,   y=-1085.0, z=22.0},	-- LSC La Mesa
	{name="Oficina", id=446, r=25.0, x=1177.0,  y=2640.0,  z=37.0},	-- LSC Harmony
	{name="Oficina", id=446, r=25.0, x=108.0,   y=6624.0,  z=31.0},	-- LSC Paleto Bay
	{name="Oficina", id=446, r=18.0, x=538.0,   y=-183.0,  z=54.0},	-- Mechanic Hawic
	{name="Oficina", id=446, r=15.0, x=1774.0,  y=3333.0,  z=41.0},	-- Mechanic Sandy Shores Airfield
	{name="Oficina", id=446, r=15.0, x=1143.0,  y=-776.0,  z=57.0},	-- Mechanic Mirror Park
	{name="Oficina", id=446, r=30.0, x=2508.0,  y=4103.0,  z=38.0},	-- Mechanic East Joshua Rd.
	{name="Oficina", id=446, r=16.0, x=2006.0,  y=3792.0,  z=32.0},	-- Mechanic Sandy Shores gas station
	{name="Oficina", id=446, r=25.0, x=484.0,   y=-1316.0, z=29.0},	-- Hayes Auto, Little Bighorn Ave.
	{name="Oficina", id=446, r=33.0, x=-1419.0, y=-450.0,  z=36.0},	-- Hayes Auto Body Shop, Del Perro
	{name="Oficina", id=446, r=33.0, x=268.0,   y=-1810.0, z=27.0},	-- Hayes Auto Body Shop, Davis
--	{name="Mechanic", id=446, r=24.0, x=288.0,   y=-1730.0, z=29.0},	-- Hayes Auto, Rancho (Disabled, looks like a warehouse for the Davis branch)
	{name="Oficina", id=446, r=27.0, x=1915.0,  y=3729.0,  z=32.0},	-- Otto's Auto Parts, Sandy Shores
	{name="Oficina", id=446, r=45.0, x=-29.0,   y=-1665.0, z=29.0},	-- Mosley Auto Service, Strawberry
	{name="Oficina", id=446, r=44.0, x=-212.0,  y=-1378.0, z=31.0},	-- Glass Heroes, Strawberry
	{name="Oficina", id=446, r=33.0, x=258.0,   y=2594.0,  z=44.0},	-- Mechanic Harmony
	{name="Oficina", id=446, r=18.0, x=-32.0,   y=-1090.0, z=26.0},	-- Simeons
	{name="Oficina", id=446, r=25.0, x=-211.0,  y=-1325.0, z=31.0},	-- Bennys
	{name="Oficina", id=446, r=25.0, x=903.0,   y=3563.0,  z=34.0},	-- Auto Repair, Grand Senora Desert
	{name="Oficina", id=446, r=25.0, x=437.0,   y=3568.0,  z=38.0}		-- Auto Shop, Grand Senora Desert
}

local fixMessages = {
	"Voce plugou a mangueira de oleo novamente",
	"Voce parou uma vazamento com um chiclete",
	"Voce prendeu algumas peças com fita gaffer",
	"Voce apertou alguns parafusos e parou uma vazamento",
	"Voce chutou o motor e ele voltou a funcionar como uma magica",
	"Voce colocou mais agua no radiador",
	"Voce gritou para o seu veiculo e por algum motivo ele voltou a funcionar"
}
local fixMessageCount = 7
local fixMessagePos = math.random(fixMessageCount)

local noFixMessages = {
	"Voce deu uma olhada na mangueira de oleo e ela ainda esta la",
	"Voce deu uma olhada no motor e ele parece estar bem",
	"Voce se certificou que a fita gaffer ainda esta segurando todo o motor",
	"Voce aumentou o volume do radio... assim nao da de ouvir os barulhos estranhos vindos do motor",
	"Voce adicionou um antirust ao radiador. Nao fez diferenca alguma",
	"Nunca arrume algo que nao esta quebrado, foi o que eles disseram. Voce nao ouviu... Bem, poderia ser pior"
}
local noFixMessageCount = 6
local noFixMessagePos = math.random(noFixMessageCount)

local pedInVehicleLast=false
local lastVehicle
local healthEngineLast = 1000.0
local healthEngineCurrent = 1000.0

local healthEngineNew = 1000.0
local healthEngineDelta = 0.0
local healthEngineDeltaScaled = 0.0

local healthBodyLast = 1000.0
local healthBodyCurrent = 1000.0
local healthBodyNew = 1000.0
local healthBodyDelta = 0.0
local healthBodyDeltaScaled = 0.0

local healthPetrolTankLast = 1000.0
local healthPetrolTankCurrent = 1000.0
local healthPetrolTankNew = 1000.0
local healthPetrolTankDelta = 0.0
local healthPetrolTankDeltaScaled = 0.0

-- Display blips on map
Citizen.CreateThread(function()
	if (displayBlips == true) then
	  for _, item in pairs(mechanics) do
		item.blip = AddBlipForCoord(item.x, item.y, item.z)
		SetBlipSprite(item.blip, item.id)
		SetBlipAsShortRange(item.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(item.name)
		EndTextCommandSetBlipName(item.blip)
	  end
	end
end)
  
RegisterNetEvent('iens:repair')
AddEventHandler('iens:repair', function()
	if isPedInVehicle() then
		local ped = GetPlayerPed(-1)		
		local vehicle = GetVehiclePedIsIn(ped, false)
		if IsNearMechanic() then
			SetVehicleUndriveable(vehicle,false)
			SetVehicleFixed(vehicle)
			healthBodyLast=1000.0
			healthEngineLast=1000.0
			healthPetrolTankLast=1000.0
			SetVehicleEngineOn(vehicle, true, false )
			notification("~g~O mecanico reparou o seu veiculo!")
			return
		end
		if GetVehicleEngineHealth(vehicle) < cascadingFailureThreshold + 5 then
			if GetVehicleOilLevel(vehicle) > 0 then
				SetVehicleUndriveable(vehicle,false)
				SetVehicleEngineHealth(vehicle, cascadingFailureThreshold + 5)
				SetVehiclePetrolTankHealth(vehicle, 750.0)
				healthEngineLast=cascadingFailureThreshold +5
				healthPetrolTankLast=750.0
					SetVehicleEngineOn(vehicle, true, false )
				SetVehicleOilLevel(vehicle,(GetVehicleOilLevel(vehicle)/3)-0.5)
				notification("~g~" .. fixMessages[fixMessagePos] .. ", agora va ate um mecanico/mecanica!")
				fixMessagePos = fixMessagePos + 1
				if fixMessagePos > fixMessageCount then fixMessagePos = 1 end
			else
				notification("~r~Seu veiculo esta muito danificado, voce nao consegue arrumar!")
			end
		else
			notification("~y~" .. noFixMessages[noFixMessagePos] )
			noFixMessagePos = noFixMessagePos + 1
			if noFixMessagePos > noFixMessageCount then noFixMessagePos = 1 end
		end
	else
		notification("~y~Voce precisa estar no veiculo para poder repara-lo")
	end
end)

RegisterNetEvent('iens:notAllowed')
AddEventHandler('iens:notAllowed', function()
	notification("~r~Voce nao tem permissao para reparar veiculos")
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

function IsNearMechanic()
	local ped = GetPlayerPed(-1)
	local pedLocation = GetEntityCoords(ped, 0)
	for _, item in pairs(mechanics) do
		local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  pedLocation["x"], pedLocation["y"], pedLocation["z"], true)
		if distance <= item.r then
			return true
		end
	end
end

function isPedInVehicle()
	local ped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		-- Check if ped is in driver seat
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)
			-- We don't want planes, helicopters, bicycles and trains
			if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
				return true
			end
		end
	end
	return false
end


Citizen.CreateThread(function()
	while true do
	Citizen.Wait(50)
		local ped = GetPlayerPed(-1)
		if isPedInVehicle() then
			vehicle = GetVehiclePedIsIn(ped, false)
			healthEngineCurrent = GetVehicleEngineHealth(vehicle)
			if healthEngineCurrent == 1000 then healthBodyLast = 1000.0 end
			healthEngineNew = healthEngineCurrent
			healthEngineDelta = healthEngineLast - healthEngineCurrent
			healthEngineDeltaScaled = healthEngineDelta * damageFactorEngine
			
			healthBodyCurrent = GetVehicleBodyHealth(vehicle)
			if healthBodyCurrent == 1000 then healthBodyLast = 1000.0 end
			healthBodyNew = healthBodyCurrent
			healthBodyDelta = healthBodyLast - healthBodyCurrent
			healthBodyDeltaScaled = healthBodyDelta * damageFactorBody
			
			healthPetrolTankCurrent = GetVehiclePetrolTankHealth(vehicle)
			if healthPetrolTankCurrent == 1000 then healthPetrolTankLast = 1000.0 end
			healthPetrolTankNew = healthPetrolTankCurrent 
			healthPetrolTankDelta = healthPetrolTankLast-healthPetrolTankCurrent
			healthPetrolTankDeltaScaled = healthPetrolTankDelta * damageFactorPetrolTank
			
			if healthEngineCurrent > engineSafeGuard+1 then
				SetVehicleUndriveable(vehicle,false)
			end

			if healthEngineCurrent <= engineSafeGuard+1 then
				SetVehicleUndriveable(vehicle,true)
			end

			-- If ped spawned a new vehicle while in a vehicle or teleported from one vehicle to another, handle as if we just entered the car
			if vehicle ~= lastVehicle then
				pedInVehicleLast = false
			end


			if pedInVehicleLast == true then
				-- Damage happened while in the car, can be multiplied

				-- Only do calculations if any damage is present on the car. Prevents weird behavior when fixing using trainer or other script
				if healthEngineCurrent ~= 1000.0 or healthBodyCurrent ~= 1000.0 or healthPetrolTankCurrent ~= 1000.0 then

					-- Combine the delta values
					local healthEngineCombinedDelta = math.max(healthEngineDeltaScaled, healthBodyDeltaScaled, healthPetrolTankDeltaScaled)

					-- If huge damage, scale back a bit
					if healthEngineCombinedDelta > (healthEngineCurrent - engineSafeGuard) then
						healthEngineCombinedDelta = healthEngineCombinedDelta * 0.7
					end

					-- If complete damage, but not catastrophic (ie. explosion territory) pull back a bit, to give a couple of seconds og engine runtime before dying
					if healthEngineCombinedDelta > healthEngineCurrent then
						healthEngineCombinedDelta = healthEngineCurrent - (cascadingFailureThreshold / 5)
					end



					------- Calculate new value

					healthEngineNew = healthEngineLast - healthEngineCombinedDelta


					------- Sanity Check on new values and further manipulations

					-- If somewhat damaged, slowly degrade until slightly before cascading failure sets in, then stop

					if healthEngineNew > (cascadingFailureThreshold + 5) and healthEngineNew < degradingFailureThreshold then
						healthEngineNew = healthEngineNew-(0.038 * degradingHealthSpeedFactor)
					end
	
					-- If Damage is near catastrophic, cascade the failure
					if healthEngineNew < cascadingFailureThreshold then
						healthEngineNew = healthEngineNew-(0.1 * cascadingFailureSpeedFactor)
					end

					-- Prevent Engine going to or below zero. Ensures you can reenter a damaged car. 
					if healthEngineNew < engineSafeGuard then
						healthEngineNew = engineSafeGuard 
					end

					-- Prevent Explosions
					if healthPetrolTankCurrent < 750 then
						healthPetrolTankNew = 750.0
					end

					-- Prevent negative body damage.
					if healthBodyNew < 0  then
						healthBodyNew = 0.0
					end
				end
			else
				-- Just got in the vehicle. Damage can not be multiplied this round

				-- Set vehicle handling data
				if deformationMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult', deformationMultiplier) end
				if weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fWeaponDamageMult', weaponsDamageMultiplier/damageFactorBody) end -- Set weaponsDamageMultiplier and compensate for damageFactorBody
				
				-- If body damage catastrophic, reset somewhat so we can get new damage to multiply
				if healthBodyCurrent < cascadingFailureThreshold then
					healthBodyNew = cascadingFailureThreshold
				end
				pedInVehicleLast = true
			end

			-- set the actual new values
			if healthEngineNew ~= healthEngineCurrent then SetVehicleEngineHealth(vehicle, healthEngineNew) end
			if healthBodyNew ~= healthBodyCurrent then SetVehicleBodyHealth(vehicle, healthBodyNew) end
			if healthPetrolTankNew ~= healthPetrolTankCurrent then SetVehiclePetrolTankHealth(vehicle, healthPetrolTankNew) end

			-- Store current values, so we can calculate delta next time around
			healthEngineLast = healthEngineNew
			healthBodyLast = healthBodyNew
			healthPetrolTankLast = healthPetrolTankNew
			lastVehicle=vehicle
		else
			if pedInVehicleLast == true then
				-- We just got out of the car
				if weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fWeaponDamageMult', weaponsDamageMultiplier) end	-- Since we are out of the vehicle, we should no longer compensate for bodyDamageFactor	
			end
			pedInVehicleLast = false
		end
	end
end)

