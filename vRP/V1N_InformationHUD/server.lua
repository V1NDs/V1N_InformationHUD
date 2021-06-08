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

--==vRP connection==--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

local vRP = Proxy.getInterface("vRP")
local vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
local vRPc = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())
--===================================--

--==Events==--
RegisterServerEvent("V1N_InformationHUD:updateHud")
AddEventHandler("V1N_InformationHUD:updateHud", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local tmpTable = vRP.getUserTmpTable({user_id})

    local data = {}
    table.insert(data, {
        type = "update",
        wallet = tmpTable.wallet, 
        bank = tmpTable.bank, 
        dirty_money = vRP.getInventoryItemAmount({user_id, "dirty_money"}),
        job = vRP.getUserGroupByType({user_id, "job"}),
        id = user_id
    })

    vRPc.updateHud(source, data)
end)
--===================================--
