ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dyrkiel:dodajmuszka')
AddEventHandler('dyrkiel:dodajmuszka', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('muszka', 1)
end)

RegisterNetEvent('dyrkiel:dodajsprezyne')
AddEventHandler('dyrkiel:dodajsprezyne', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('sprezyna', 1)
end)

RegisterNetEvent('dyrkiel:dodajlufe')
AddEventHandler('dyrkiel:dodajlufe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('lufa', 1)
end)

RegisterNetEvent('dyrkiel:dodajzamek')
AddEventHandler('dyrkiel:dodajzamek', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('zamek', 1)
end)

RegisterNetEvent('dyrkiel:dodajspust')
AddEventHandler('dyrkiel:dodajspust', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('spust', 1)
end)

RegisterNetEvent('dyrkiel:stworzjebanypistolet')
AddEventHandler('dyrkiel:stworzjebanypistolet', function()
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local iloscmuszek = xPlayer.getInventoryItem('muszka') 
    local ilosczamkow = xPlayer.getInventoryItem('zamek')
    local iloscspostow = xPlayer.getInventoryItem('spust')
    local iloscsprezyn = xPlayer.getInventoryItem('sprezyna')
    local iloscluf = xPlayer.getInventoryItem('lufa')
    if iloscmuszek.count >= 1 and ilosczamkow.count >= 1 and iloscspostow.count >= 1 and iloscsprezyn.count >= 1 and iloscluf.count >= 1 then
        xPlayer.removeInventoryItem('muszka', 1)
        xPlayer.removeInventoryItem('zamek', 1)
        xPlayer.removeInventoryItem('spust', 1)
        xPlayer.removeInventoryItem('sprezyna', 1)
        xPlayer.removeInventoryItem('lufa', 1)
        xPlayer.addInventoryItem('pistol', 1)
        TriggerClientEvent('esx:showNotification', source, '~g~~g~Stworzyłeś Pistolet!')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Nie masz wystarczająco Przedmiotów!')
    end
end)

RegisterNetEvent('dyrkiel:stworzpistoletmk2')
AddEventHandler('dyrkiel:stworzpistoletmk2', function()
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local iloscmuszek = xPlayer.getInventoryItem('muszka') 
    local ilosczamkow = xPlayer.getInventoryItem('zamek')
    local iloscspostow = xPlayer.getInventoryItem('spust')
    local iloscsprezyn = xPlayer.getInventoryItem('sprezyna')
    local iloscluf = xPlayer.getInventoryItem('lufa')
    if iloscmuszek.count >= 2 and ilosczamkow.count >= 1 and iloscspostow.count >= 1 and iloscsprezyn.count >= 3 and iloscluf.count >= 1 then
        xPlayer.removeInventoryItem('muszka', 2)
        xPlayer.removeInventoryItem('zamek', 1)
        xPlayer.removeInventoryItem('spust', 1)
        xPlayer.removeInventoryItem('sprezyna', 3)
        xPlayer.removeInventoryItem('lufa', 1)
        xPlayer.addInventoryItem('pistol_mk2', 1)
        TriggerClientEvent('esx:showNotification', source, '~g~Stworzyłeś Pistolet MK2!')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Nie masz wystarczająco Przedmiotów!')
    end
end)

RegisterNetEvent('dyrkiel:stworzpukawke')
AddEventHandler('dyrkiel:stworzpukawke', function()
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local iloscmuszek = xPlayer.getInventoryItem('muszka') 
    local ilosczamkow = xPlayer.getInventoryItem('zamek')
    local iloscspostow = xPlayer.getInventoryItem('spust')
    local iloscsprezyn = xPlayer.getInventoryItem('sprezyna')
    local iloscluf = xPlayer.getInventoryItem('lufa')
    if iloscmuszek.count >= 2 and ilosczamkow.count >= 2 and iloscspostow.count >= 1 and iloscsprezyn.count >= 2 and iloscluf.count >= 1 then
        xPlayer.removeInventoryItem('muszka', 2)
        xPlayer.removeInventoryItem('zamek', 2)
        xPlayer.removeInventoryItem('spust', 1)
        xPlayer.removeInventoryItem('sprezyna', 2)
        xPlayer.removeInventoryItem('lufa', 1)
        xPlayer.addInventoryItem('snspistol', 1)
        TriggerClientEvent('esx:showNotification', source, '~g~Stworzyłeś Pukawke!')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Nie masz wystarczająco Przedmiotów!')
    end
end)

RegisterNetEvent('dyrkiel:stworzpukawkemk2')
AddEventHandler('dyrkiel:stworzpukawkemk2', function()
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local iloscmuszek = xPlayer.getInventoryItem('muszka') 
    local ilosczamkow = xPlayer.getInventoryItem('zamek')
    local iloscspostow = xPlayer.getInventoryItem('spust')
    local iloscsprezyn = xPlayer.getInventoryItem('sprezyna')
    local iloscluf = xPlayer.getInventoryItem('lufa')
    if iloscmuszek.count >= 3 and ilosczamkow.count >= 2 and iloscspostow.count >= 2 and iloscsprezyn.count >= 2 and iloscluf.count >= 1 then
        xPlayer.removeInventoryItem('muszka', 3)
        xPlayer.removeInventoryItem('zamek', 2)
        xPlayer.removeInventoryItem('spust', 2)
        xPlayer.removeInventoryItem('sprezyna', 2)
        xPlayer.removeInventoryItem('lufa', 1)
        xPlayer.addInventoryItem('snspistol_mk2', 1)
        TriggerClientEvent('esx:showNotification', source, '~g~Stworzyłeś Pukawke MK2!')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Nie masz wystarczająco Przedmiotów!')
    end
end)

RegisterNetEvent('dyrkiel:stworzvintek')
AddEventHandler('dyrkiel:stworzvintek', function()
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local iloscmuszek = xPlayer.getInventoryItem('muszka') 
    local ilosczamkow = xPlayer.getInventoryItem('zamek')
    local iloscspostow = xPlayer.getInventoryItem('spust')
    local iloscsprezyn = xPlayer.getInventoryItem('sprezyna')
    local iloscluf = xPlayer.getInventoryItem('lufa')
    if iloscmuszek.count >= 3 and ilosczamkow.count >= 2 and iloscspostow.count >= 2 and iloscsprezyn.count >= 2 and iloscluf.count >= 2 then
        xPlayer.removeInventoryItem('muszka', 3)
        xPlayer.removeInventoryItem('zamek', 2)
        xPlayer.removeInventoryItem('spust', 2)
        xPlayer.removeInventoryItem('sprezyna', 2)
        xPlayer.removeInventoryItem('lufa', 2)
        xPlayer.addInventoryItem('vintagepistol', 1)
        TriggerClientEvent('esx:showNotification', source, '~g~Stworzyłeś Pistolet Vintage!')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Nie masz wystarczająco Przedmiotów!')
    end
end)