
local items = {}

local function play_drink(player)
  local seq = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

local pills_choices = {}
pills_choices["Take"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"pills",1) then
      vRPclient.varyHealth(player,{25})
      vRPclient.notify(player,{"~g~ Tomando pilulas."})
      play_drink(player)
      vRP.closeMenu(player)
    end
  end
end}

local function play_smoke(player)
  local seq2 = {
    {"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
    {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
    {"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
  }

  vRPclient.playAnim(player,{true,seq2,false})
end

local smoke_choices = {}
smoke_choices["Take"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"weed",1) then
	  vRP.varyHunger(user_id,(20))
      vRPclient.notify(player,{"~g~ fumando maconha."})
      play_smoke(player)
      vRP.closeMenu(player)
    end
  end
end}

local function play_smell(player)
  local seq3 = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq3,false})
end

local smell_choices = {}
smell_choices["Take"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"cocaine",1) then
	  vRP.varyThirst(user_id,(20))
      vRPclient.notify(player,{"~g~ cheirando cocaina."})
      play_smell(player)
      vRP.closeMenu(player)
    end
  end
end}

local function play_lsd(player)
  local seq4 = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq4,false})
end

local lsd_choices = {}
lsd_choices["Take"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"lsd",1) then
	  vRP.varyThirst(user_id,(20))
      vRPclient.notify(player,{"~g~ tomando LSD"})
      play_lsd(player)
      vRP.closeMenu(player)
    end
  end
end}

items["pills"] = {"Pilulas","Um medicamento simples.",function(args) return pills_choices end,0.1}
items["weed"] = {"Maconha","Um pouco de erva.",function(args) return smoke_choices end,0.10}
items["cocaine"] = {"Cocaina","Um pouco de cocaina.",function(args) return smell_choices end,0.5}
items["lsd"] = {"LSD","Um LSD.",function(args) return lsd_choices end,0.1}
items["Medical Weed"] = {"Maconha Medicinal","Usado pelos medicos."}
items["Presents"] = {"Presente Premiado","Dado as criancas."}

return items