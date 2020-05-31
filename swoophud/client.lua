local lvMoney = 0
local lvBankMoney = 0
local lvHunger = 0
local lvThirst = 0
local lvJob

local lvArmor
local lvHealth
local lvStatus
local changed


Citizen.CreateThread(function()
	while true do
		if changed then
			SendNUIMessage({
				status = lvStatus,
				money = lvMoney,
				bankMoney = lvBankMoney,
				health = lvHealth,
				armor = lvArmor,
				hunger = lvHunger,
				thirst = lvThirst,
				job = lvJob,
				speed = lvSpeed
			})
			changed = false
		end
		Citizen.Wait(250)
	end
end)

Citizen.CreateThread(function()
    while(true) do
		TriggerServerEvent("getMoney")
		TriggerServerEvent("getNeeds")
		TriggerServerEvent("getJob")
		lvArmor = GetPedArmour(GetPlayerPed(-1))
		lvHealth = (GetEntityHealth(GetPlayerPed(-1))-100)
		lvStatus = IsPauseMenuActive()
		changed = true
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent("returnMoney")
AddEventHandler("returnMoney", function (cash, bankMoney)
	lvMoney = cash
	lvBankMoney = bankMoney
end)

RegisterNetEvent("returnNeeds")
AddEventHandler("returnNeeds", function (hunger, thirst)
	lvHunger = hunger
	lvThirst = thirst
end)

RegisterNetEvent ("returnJob")
AddEventHandler("returnJob", function (job)
	lvJob = job
end)