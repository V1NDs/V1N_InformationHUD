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

--==Functions==--
function getAccounts(data, xPlayer) local result = {} for i=1, #data do if(data[i] ~= 'money') then if(data[i] == 'black_money') and not true then result[i] = nil else result[i] = xPlayer.getAccount(data[i])['money'] end else result[i] = xPlayer.getMoney() end end return result end
--===================================--

--==Events==--
RegisterServerEvent('V1N_InformationHUD:updateHud')
AddEventHandler('V1N_InformationHUD:updateHud', function()
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
	    local money, bank, black_money = table.unpack(getAccounts({'money', 'bank', 'black_money'}, xPlayer))
	    TriggerClientEvent('V1N_InformationHUD:updateHud_', source, {cash = money, bank = bank, black_money = black_money})
	end
end)
--===================================--
