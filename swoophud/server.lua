local proxy = module("vrp", "lib/Proxy")
vRP = proxy.getInterface("vRP")

RegisterServerEvent("swoophud:getMoney")
AddEventHandler("swoophud:getMoney", function()
	local userID = vRP.getUserId({source}) -- Get user ID
	TriggerClientEvent("swoophud:returnMoney", source, vRP.getMoney({userID}), vRP.getBankMoney({userID})) -- Call client event 'returnMoney'
end)

RegisterServerEvent("swoophud:getJob")
AddEventHandler("swoophud:getJob", function()
	local userID = vRP.getUserId({source}) -- Get user ID
	TriggerClientEvent("swoophud:returnJob", source, vRP.getUserGroupByType({userID, "job"})) -- Call client event 'returnMoney'
end)

RegisterServerEvent("swoophud:getPlayerState")
AddEventHandler("swoophud:getPlayerState", function()
	local userID = vRP.getUserId({source}) -- Get user ID
	TriggerClientEvent("swoophud:returnPlayerState", source, 100 - vRP.getHunger({userID}), 100 - vRP.getThirst({userID})) -- Call client event 'returnMoney'
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
	local job = vRP.getUserGroupByType({user_id, "job"})
	TriggerClientEvent("returnJob", source, group) -- Call client event 'returnNeeds'
end)

AddEventHandler("vRP:playerLeaveGroup", function(user_id, group, gtype)
    if gtype == "job" then 
        TriggerClientEvent("returnJob", source, "") -- Call client event 'returnNeeds'
    end
end)

--[[local proxy = module("vrp", "lib/Proxy")
vRP = proxy.getInterface("vRP")

RegisterServerEvent("getMoney")
AddEventHandler("getMoney", function()
	local userID = vRP.getUserId({source}) -- Get user ID
	TriggerClientEvent("returnMoney", source, vRP.getMoney({userID}), vRP.getBankMoney({userID})) -- Call client event 'returnMoney'
end)

RegisterServerEvent("getNeeds")
AddEventHandler("getNeeds", function()
	local userID = vRP.getUserId({source}) -- Get user ID
	TriggerClientEvent("returnNeeds", source, vRP.getHunger({userID}), vRP.getThirst({userID})) -- Call client event 'returnNeeds'
end)

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    local job = vRP.getUserGroupByType({user_id,"job"})
	TriggerClientEvent("returnJob", source, job) -- Call client event 'returnNeeds'
  end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
	local job = vRP.getUserGroupByType({user_id,"job"})
	TriggerClientEvent("returnJob", source, group) -- Call client event 'returnNeeds'
end)

AddEventHandler("vRP:playerLeaveGroup", function(user_id, group, gtype)
  if gtype == "job" then 
	TriggerClientEvent("returnJob", source, "") -- Call client event 'returnNeeds'
  end
end)

RegisterServerEvent("getJob")
AddEventHandler("getJob", function()
	local userID = vRP.getUserId({source}) -- Get user ID
    local job = vRP.getUserGroupByType({userID, "job"})
    TriggerClientEvent("returnJob", source, job) -- Call client event 'returnNeeds'
end)]]--