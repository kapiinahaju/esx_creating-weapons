ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

local koordynatysmietnikow = {
    [1] = {-683.2899780273438, 5788.02001953125, 17.32999992370605},
    [2] = {564.9600219726562, 2803.300048828125, 42.11999893188476},
    [3] = {1288.02001953125, 3623.449951171875, 33.04000091552734},
    [4] = {252.9600067138672, 2588.27001953125, 45},
}

function pokaztogowno(mesydz)
    SetTextComponentFormat("STRING")
    AddTextComponentString(mesydz)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
  end

Citizen.CreateThread(function()
    local spij = true 
    local ped = PlayerPedId()
    while true do
        local kordypeda = GetEntityCoords(ped)
        for klucz,wartosc in pairs(koordynatysmietnikow) do
            local kordysmietiki = vector3(wartosc[1], wartosc[2], wartosc[3])
            local dystans = #(kordypeda - kordysmietiki)
            if dystans < 2 then 
                ESX.ShowHelpNotification('~y~Naciśnij ~INPUT_CONTEXT~ aby szukać w śmietanikach.')
                DrawMarker(22, kordysmietiki, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 105, 180, 200, true, true, 2, false, false, false, false)
                if IsControlJustPressed(ped, 38) then
                    FreezeEntityPosition(ped, true)
                    exports['verti_taskbar']:taskBar(2000, 'Szukanie Części...', true, false)
                    FreezeEntityPosition(ped, false)
                    local wylosujpsiejebany = math.random(1,9)
                    if wylosujpsiejebany == 1 then
                        TriggerServerEvent("dyrkiel:dodajmuszka")
                        ESX.ShowNotification("~g~Znalazłeś Przedmiot!")
                    end
                    if wylosujpsiejebany == 2 then
                        ESX.ShowNotification('~r~Nic Nie znalazłeś!')    
                    end
                    if wylosujpsiejebany == 3 then 
                        ESX.ShowNotification('~r~Nic Nie znalazłeś!')
                    end
                    if wylosujpsiejebany == 4 then 
                        TriggerServerEvent("dyrkiel:dodajsprezyne")
                        ESX.ShowNotification("~g~Znalałeś Przedmiot!") 
                    end
                    if wylosujpsiejebany == 5 then 
                        TriggerServerEvent('dyrkiel:dodajspust')
                        ESX.ShowNotification("~g~Znalałeś Przedmiot!") 
                    end
                    if wylosujpsiejebany == 6 then 
                        ESX.ShowNotification('~r~Nic Nie znalazłeś!')
                    end
                    if wylosujpsiejebany == 7 then 
                        TriggerServerEvent('dyrkiel:dodajlufe')
                        ESX.ShowNotification("~g~Znalałeś Przedmiot!") 
                    end
                    if wylosujpsiejebany == 8 then 
                        TriggerServerEvent('dyrkiel:dodajzamek')
                        ESX.ShowNotification("~g~Znalałeś Przedmiot!") 
                    end
                    if wylosujpsiejebany == 9 then 
                        ESX.ShowNotification('~r~Nic Nie znalazłeś!')
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
    if spij then
        Citizen.Wait(5000)
    end
end)


local kordycraft = { 
    [1] = {282.2300109863281, 6789.22998046875, 15.6899995803833},
    [2] = {2074.429931640625, 3196.360107421875, 45.13000106811523},
}


Citizen.CreateThread(function()
    local spij = true 
    local ped = PlayerPedId() 
    while true do 
        local kordypeda = GetEntityCoords(ped)
        for klucz,wartosc in pairs(kordycraft) do 
            local kordycrafting = vector3(wartosc[1], wartosc[2], wartosc[3])
            local dystansodcrafta = #(kordypeda - kordycrafting)
            if dystansodcrafta < 2 then
                ESX.ShowHelpNotification('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyc menu tworzenia.')
                DrawMarker(22, kordycrafting, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 105, 180, 200, true, true, 2, false, false, false, false)
                if IsControlJustPressed(ped, 38) then
                    otworzmenubroni()
                end
            end
        end
        Citizen.Wait(0)
    end
    if spij then
        Citizen.Wait(5000)
    end
end)



function otworzmenubroni()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'craftbroni',
        {
            title    = 'Tworzenie Broni',
            align    = 'center',
            elements = {
                {label = 'Pistolet', value = 'pistol'},
                {label = 'Pistolet MK2', value = 'pistolmk2'},
                {label = 'Pukawka', value = 'pukawka'},
                {label = 'Pukawka MK2', value = 'pukawkamk2'},
                {label = 'Pistolet Vintage', value = 'vintage'}
            }
        }, function(data, menu)
            local ped = PlayerPedId()
            if data.current.value == 'pistol' then
                otworzpistol()
            end
            if data.current.value == 'pistolmk2' then 
                otworzpistolmk2()
            end
            if data.current.value == 'pukawka' then 
                otworzpukawka()
            end
            if data.current.value == 'pukawkamk2' then 
                otworzpukawkamk2()
            end
            if data.current.value == 'vintage' then 
                otworzvintek()
            end
            menu.close()
          end,
          function(data, menu)
            menu.close()
          end
        )
      end

function otworzpistol()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craftbroni2',
    {
        title = 'Potrzebne Przedmioty',
        align = 'center',
        elements = {
            {label = 'Sprężyna x1', value = 'none'},
            {label = 'Muszka x1', value = 'none'},
            {label = 'Spust x1', value = 'none'},
            {label = 'Lufa x1', value = 'none'},
            {label = 'Zamek x1', value = 'none'},
            {label = '<span style="color:lightgreen;">Stwórz Broń</span>', value = 'zrobtakurwajebanabronwpizde'},
        }
    }, function(data, menu)
        local ped = PlayerPedId()
        if data.current.value == 'zrobtakurwajebanabronwpizde' then
            exports['verti_taskbar']:taskBar(20000, 'Tworzenie Pistoletu...', true, false)
            TriggerServerEvent('dyrkiel:stworzjebanypistolet') 
        end
        menu.close()
      end,
      function(data, menu)
        menu.close()
      end
    )
  end

  function otworzpistolmk2()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craftbroni2',
    {
        title = 'Potrzebne Przedmioty',
        align = 'center',
        elements = {
            {label = 'Sprężyna x3', value = 'none'},
            {label = 'Muszka x2', value = 'none'},
            {label = 'Spust x1', value = 'none'},
            {label = 'Lufa x1', value = 'none'},
            {label = 'Zamek x1', value = 'none'},
            {label = '<span style="color:lightgreen;">Stwórz Broń</span>', value = 'zrobpistoletmk2'},
        }
    }, function(data2, menu)
        local ped = PlayerPedId()
        if data2.current.value == 'zrobpistoletmk2' then
            exports['verti_taskbar']:taskBar(20000, 'Tworzenie Pistoletu MK2...', true, false)
            TriggerServerEvent('dyrkiel:stworzpistoletmk2')
        end
        menu.close()
      end,
      function(data, menu)
        menu.close()
      end
    )
end

function otworzpukawka()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craftbroni2',
    {
        title = 'Potrzebne Przedmioty',
        align = 'center',
        elements = {
            {label = 'Sprężyna x2', value = 'none'},
            {label = 'Muszka x2', value = 'none'},
            {label = 'Spust x1', value = 'none'},
            {label = 'Lufa x1', value = 'none'},
            {label = 'Zamek x2', value = 'none'},
            {label = '<span style="color:lightgreen;">Stwórz Broń</span>', value = 'zrobpukawka'},
        }
    }, function(data2, menu)
        local ped = PlayerPedId()
        if data2.current.value == 'zrobpukawka' then
            exports['verti_taskbar']:taskBar(20000, 'Tworzenie Pukawki...', true, false)
            TriggerServerEvent('dyrkiel:stworzpukawke')
        end
        menu.close()
      end,
      function(data, menu)
        menu.close()
      end
    )
end

function otworzpukawkamk2()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craftbroni2',
    {
        title = 'Potrzebne Przedmioty',
        align = 'center',
        elements = {
            {label = 'Sprężyna x2', value = 'none'},
            {label = 'Muszka x3', value = 'none'},
            {label = 'Spust x2', value = 'none'},
            {label = 'Lufa x1', value = 'none'},
            {label = 'Zamek x2', value = 'none'},
            {label = '<span style="color:lightgreen;">Stwórz Broń</span>', value = 'zrobpukawkamk2'},
        }
    }, function(data2, menu)
        local ped = PlayerPedId()
        if data2.current.value == 'zrobpukawkamk2' then
            exports['verti_taskbar']:taskBar(20000, 'Tworzenie Pukawki MK2...', true, false)
            TriggerServerEvent('dyrkiel:stworzpukawkemk2')
        end
        menu.close()
      end,
      function(data, menu)
        menu.close()
      end
    )
end

function otworzvintek()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craftbroni2',
    {
        title = 'Potrzebne Przedmioty',
        align = 'center',
        elements = {
            {label = 'Sprężyna x2', value = 'none'},
            {label = 'Muszka x3', value = 'none'},
            {label = 'Spust x2', value = 'none'},
            {label = 'Lufa x2', value = 'none'},
            {label = 'Zamek x2', value = 'none'},
            {label = '<span style="color:lightgreen;">Stwórz Broń</span>', value = 'zrobvintka'},
        }
    }, function(data2, menu)
        local ped = PlayerPedId()
        if data2.current.value == 'zrobvintka' then
            exports['verti_taskbar']:taskBar(20000, 'Tworzenie Pistoletu Vintage...', true, false)
            TriggerServerEvent('dyrkiel:stworzvintek')
        end
        menu.close()
      end,
      function(data, menu)
        menu.close()
      end
    )
end



