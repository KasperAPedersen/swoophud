local proxy = module("vrp", "lib/Proxy")
vRP = proxy.getInterface("vRP")

RegisterServerEvent("getMoney")
AddEventHandler("getMoney", function()
	local userID = vRP.getUserId({source})
	TriggerClientEvent("returnMoney", source, vRP.getMoney({userID}), vRP.getBankMoney({userID}))
end)

RegisterServerEvent("getNeeds")
AddEventHandler("getNeeds", function()
	local userID = vRP.getUserId({source})
	TriggerClientEvent("returnNeeds", source, vRP.getHunger({userID}), vRP.getThirst({userID})
end)

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    local job = vRP.getUserGroupByType({user_id,"job"})
	TriggerClientEvent("returnJob", source, job)
  end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
	local job = vRP.getUserGroupByType({user_id,"job"})
	TriggerClientEvent("returnJob", source, group)
end)

AddEventHandler("vRP:playerLeaveGroup", function(user_id, group, gtype)
  if gtype == "job" then 
	TriggerClientEvent("returnJob", source, "")
  end
end)

RegisterServerEvent("getJob")
AddEventHandler("getJob", function()
	local userID = vRP.getUserId({source})
    local job = vRP.getUserGroupByType({userID, "job"})
    TriggerClientEvent("returnJob", source, job)
end)