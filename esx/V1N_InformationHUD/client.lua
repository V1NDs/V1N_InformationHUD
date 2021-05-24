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

--==esx connection==--
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--===================================--

--==Threads==--
Citizen.CreateThread(function()
    while true do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj ESX.PlayerData = ESX.GetPlayerData() end)

        local money
        local bank
        local blackMoney
        local job
    

        if ESX.PlayerData.job.label == ESX.PlayerData.job.grade_label then
            job = ESX.PlayerData.job.grade_label
        else
            job = ESX.PlayerData.job.label .. ' - ' .. ESX.PlayerData.job.grade_label
        end
    
    
        for i=1, #ESX.PlayerData.accounts, 1 do
            if ESX.PlayerData.accounts[i].name == 'black_money' then
                blackMoney = ESX.PlayerData.accounts[i].money
            elseif ESX.PlayerData.accounts[i].name == 'bank' then
                bank = ESX.PlayerData.accounts[i].money
            elseif ESX.PlayerData.accounts[i].name == 'money' then
                money = ESX.PlayerData.accounts[i].money
            end
        end
    
        SendNUIMessage({
            type = "update",
            wallet = money,
            bank = bank,
            dirty_money = blackMoney,
            job = job
        })
    
        Citizen.Wait(2500)
    end
end)
--===================================--
