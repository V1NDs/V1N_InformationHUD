--[[
────────────────────────────────────────────────────────────────────────────────
─██████──██████─████████───██████──────────██████─████████████───██████████████─
─██░░██──██░░██─██░░░░██───██░░██████████──██░░██─██░░░░░░░░████─██░░░░░░░░░░██─
─██░░██──██░░██─████░░██───██░░░░░░░░░░██──██░░██─██░░████░░░░██─██░░██████████─
─██░░██──██░░██───██░░██───██░░██████░░██──██░░██─██░░██──██░░██─██░░██─────────
─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─██░░██████████─
─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██─
─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─██████████░░██─
─██░░░░██░░░░██───██░░██───██░░██──██░░██████░░██─██░░██──██░░██─────────██░░██─
─████░░░░░░████─████░░████─██░░██──██░░░░░░░░░░██─██░░████░░░░██─██████████░░██─
───████░░████───██░░░░░░██─██░░██──██████████░░██─██░░░░░░░░████─██░░░░░░░░░░██─
─────██████─────██████████─██████──────────██████─████████████───██████████████─
────────────────────────────────────────────────────────────────────────────────
Discord: V1NDs#0977
Youtube: https://www.youtube.com/channel/UCaBZGvYryg09IS-uaSHyfPw
Github: https://github.com/V1NDs
]]--

ESX = nil
local PlayerData = nil

Citizen.CreateThread(function()
    while ESX == nil do	
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)

        Citizen.Wait(10)
    end
    Citizen.Wait(3000)
    if PlayerData == nil or PlayerData.job == nil then
	  	PlayerData = ESX.GetPlayerData()
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

--==Functions==--
RegisterNetEvent("V1N_InformationHUD:updateHud_")
AddEventHandler("V1N_InformationHUD:updateHud_", function(data)
    local jobName = PlayerData.job.label
	local gradeName = PlayerData.job.grade_label

    if gradeName ~= nil then
        job = jobName.." - "..gradeName
    else
        job = jobName
    end

    SendNUIMessage({
        type = "update",
        wallet = data.cash,
        bank = data.bank,
        dirty_money = data.black_money,
        job = job
    })
end)
--===================================--

--==Threads==--
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("V1N_InformationHUD:updateHud")
        Citizen.Wait(2500)
    end
end)
--===================================--