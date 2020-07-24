local lvjob = ""
local lvhealth = 0
local lvarmor = 0
local lvhunger = 0
local lvthirst = 0
local lvmoney = 0
local lvbankMoney = 0

Citizen.CreateThread(function()
    while true do 
        TriggerServerEvent("swoophud:getMoney")
        TriggerServerEvent("swoophud:getJob")
        TriggerServerEvent("swoophud:getPlayerState")
        Citizen.Wait(500)
        local ped = GetPlayerPed(-1)
        SendNUIMessage({
            status = IsPauseMenuActive(),
            money = lvmoney,
            bankMoney = lvbankMoney,
            job = lvjob,
            hunger = lvhunger,
            thirst = lvthirst,
            health = (GetEntityHealth(ped)-100),
            armor = GetPedArmour(ped)
        })
    end
end)

RegisterNetEvent("swoophud:returnMoney")
AddEventHandler("swoophud:returnMoney", function (m, bm)
	lvmoney = m
	lvbankMoney = bm
end)

RegisterNetEvent("swoophud:returnJob")
AddEventHandler("swoophud:returnJob", function (userJob)
	lvjob = userJob
end)

RegisterNetEvent("swoophud:returnPlayerState")
AddEventHandler("swoophud:returnPlayerState", function (hun, thi)
    lvhunger = hun
    lvthirst = thi
end)



















-----------------------------------------------------
--[[

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
    while true do
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
end)]]--