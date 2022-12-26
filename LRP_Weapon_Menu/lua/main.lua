local raw = LoadResourceFile(GetCurrentResourceName(), 'json/addonlist.json')
local data = json.decode(raw)

local defaultraw = LoadResourceFile(GetCurrentResourceName(), 'json/defaultlist.json')
local defaultdata = json.decode(defaultraw)

local menu = MenuV:CreateMenu(false, 'markomods.com | weapon menu', data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv', 'Test')
local defaultweapons = MenuV:CreateMenu(false, 'Saved Loadouts', data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv', 'Test2')
local loadouts = MenuV:CreateMenu(false, 'Loadouts', data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv', 'Test3')
local savedloadouts = MenuV:CreateMenu(false, 'Saved Loadouts', data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv', 'Test4')

local table_loadout = {}
local table_weapon = {}
local table_components = {}

function createMenu()
    local defaultweapon = menu:AddButton({ icon = '📘', label = "Default Weapons", value = customize, description = data.config.bottomText })
    defaultweapon:On('select', function(item,  value)
        MenuV:OpenMenu(defaultweapons)
    end)
    for k,v in pairs(data) do
        if IsWeaponValid(GetHashKey(k)) then
            local weapon = menu:AddButton({ icon = '🔫', label = v.label, value = customize, description = data.config.bottomText })
            weapon:On('select', function(item, value) 
                local weaponmenu = MenuV:CreateMenu(false, 'Customizing ' .. v.label, data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv')
                local spawn = weaponmenu:AddButton({ icon = '📋', label = 'Spawn ' .. v.label, value = 'spawner', description = 'Spawn your ' .. v.label })
                local despawn = weaponmenu:AddButton({ icon = '📋', label = 'Despawn ' .. v.label, value = 'despawner', description = 'Despawn your ' .. v.label })
                spawn:On('select', function(item, value) 
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(k), v.spawnammo, true, true)
                    ShowNotification("Spawned " .. v.label)
                end)
                despawn:On('select', function(item, value) 
                    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(k))
                    ShowNotification("Despawned " .. v.label)
                end)    
                local refill = weaponmenu:AddButton({ icon = '📌', label = "Refill Ammo", value = 'refillammo', description = 'Refill your ammo (100 bullets)'})
                refill:On('select', function(item,  value)
                    AddAmmoToPed(GetPlayerPed(-1), GetHashKey(k), 100)
                    ShowNotification("Refilled Ammo!")
                end)
                for attachments_key,attachments_value in pairs(v.attachments) do    
                    if attachments_value then
                        local attachment = weaponmenu:AddButton({ icon = '🔫', label = attachments_key, value = 'spawner', description = 'Change your ' .. attachments_key })
                        attachment:On('select', function(item, value)
                            local componentsmenu = MenuV:CreateMenu(false, 'Changing Attachments', data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv')
                            for _, attach_item  in ipairs(attachments_value) do
                                local component = componentsmenu:AddButton({ icon = '🔫', label = attach_item.label, value = 'component', description = attach_item.label})
                                component:On('select', function(item, value)
                                    if HasPedGotWeaponComponent(GetPlayerPed(-1), GetHashKey(k), GetHashKey(attach_item.value)) then
                                        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey(k), GetHashKey(attach_item.value))
                                    else
                                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(k), GetHashKey(attach_item.value))
                                    end
                                end)    
                            end
                            MenuV:OpenMenu(componentsmenu)
                        end)
                    end
                end
                MenuV:OpenMenu(weaponmenu)
            end)
        end
    end
    for k,v in pairs(defaultdata) do
        if IsWeaponValid(GetHashKey(k)) then
            local weapon = defaultweapons:AddButton({ icon = '🔫', label = v.label, value = customize, description = data.config.bottomText })
            weapon:On('select', function(item, value) 
                local weaponmenu = MenuV:CreateMenu(false, 'Customizing ' .. v.label, data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv')
                local spawn = weaponmenu:AddButton({ icon = '📋', label = 'Spawn ' .. v.label, value = 'spawner', description = 'Spawn your ' .. v.label })
                local despawn = weaponmenu:AddButton({ icon = '📋', label = 'Despawn ' .. v.label, value = 'despawner', description = 'Despawn your ' .. v.label })
                spawn:On('select', function(item, value) 
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(k), v.spawnammo, true, true)
                    ShowNotification("Spawned " .. v.label)
                end)
                despawn:On('select', function(item, value) 
                    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(k))
                    ShowNotification("Despawned " .. v.label)
                end)    
                local refill = weaponmenu:AddButton({ icon = '📌', label = "Refill Ammo", value = 'refillammo', description = 'Refill your ammo (100 bullets)'})
                refill:On('select', function(item,  value)
                    AddAmmoToPed(GetPlayerPed(-1), GetHashKey(k), 100)
                    ShowNotification("Refilled Ammo!")
                end)
                for attachments_key,attachments_value in pairs(v.attachments) do    
                    if attachments_value then
                        local attachment = weaponmenu:AddButton({ icon = '🔫', label = attachments_key, value = 'spawner', description = 'Change your ' .. attachments_key })
                        attachment:On('select', function(item, value)
                            local componentsmenu = MenuV:CreateMenu(false, 'Changing Attachments', data.config.position, data.config.color.r, data.config.color.g, data.config.color.b, 'size-125', 'none', 'menuv')
                            for _, attach_item  in ipairs(attachments_value) do
                                local component = componentsmenu:AddButton({ icon = '🔫', label = attach_item.label, value = 'component', description = attach_item.label})
                                component:On('select', function(item, value)
                                    if HasPedGotWeaponComponent(GetPlayerPed(-1), GetHashKey(k), GetHashKey(attach_item.value)) then
                                        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey(k), GetHashKey(attach_item.value))
                                    else
                                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(k), GetHashKey(attach_item.value))
                                    end
                                end)    
                            end
                            MenuV:OpenMenu(componentsmenu)
                        end)
                    end
                end
                MenuV:OpenMenu(weaponmenu)
            end)
        end
    end

    local openloadouts = menu:AddButton({ icon = '🧾', label = "Loadouts", value = customize, description = data.config.bottomText })
    openloadouts:On('select', function(item,  value)
        MenuV:OpenMenu(loadouts)
    end)
    local saveloadouts = loadouts:AddButton({ icon = '🧾', label = "Save current loadout", value = customize, description = data.config.bottomText })
    saveloadouts:On('select', function(item,  value)
        for k,v in pairs(data) do
            if HasPedGotWeapon(GetPlayerPed(-1), k, false) then
                table_weapon[#table_weapon +1] = k
                for attachments_key,attachments_value in pairs(v.attachments) do
                    if attachments_value then
                        for _, attach_item  in ipairs(attachments_value) do
                            if HasPedGotWeaponComponent(GetPlayerPed(-1), k, attach_item.value) then
                                table_components[#table_components +1] = attach_item.value
                            end
                        end
                    end
                end
            end
        end
        for k,v in pairs(defaultdata) do
            if HasPedGotWeapon(GetPlayerPed(-1), k, false) then
                table_weapon[#table_weapon +1] = k
                for attachments_key,attachments_value in pairs(v.attachments) do
                    if attachments_value then
                        for _, attach_item  in ipairs(attachments_value) do
                            if HasPedGotWeaponComponent(GetPlayerPed(-1), k, attach_item.value) then
                                table_components[#table_components +1] = attach_item.value
                            end
                        end
                    end
                end
            end
        end
        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local result = GetOnscreenKeyboardResult()
            table_loadout[#table_loadout +1] = result
        end
        TriggerServerEvent('mm:event2', table_loadout, table_weapon, table_components)
        TriggerServerEvent('mm:event2', nil, nil, nil)
        savedloadouts:ClearItems()
        TriggerServerEvent('mm:event3')
        for i=1, #table_loadout do
            table_loadout[i] = nil
        end
        for i=1, #table_weapon do
            table_weapon[i] = nil
        end
        for i=1, #table_components do
            table_components[i] = nil
        end
    
    end)
    
    savedloadouts:ClearItems()
    local savedloadoutsb = loadouts:AddButton({ icon = '🏷️', label = "Saved loadouts", value = customize, description = data.config.bottomText })
    savedloadoutsb:On('select', function(item,  value)
        MenuV:OpenMenu(savedloadouts)
    end)
    local removeall = loadouts:AddButton({ icon = '❌', label = "Remove All Weapons", value = customize, description = data.config.bottomText })
    removeall:On('select', function(item,  value)
        for k,v in pairs(data) do
            if IsWeaponValid(GetHashKey(k)) then
                RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(k))
                ShowNotification("Spawned All Weapons")
            end
        end
        for k,v in pairs(defaultdata) do
            if IsWeaponValid(GetHashKey(k)) then
                RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(k))
            end
        end
    end)
    TriggerServerEvent('mm:event3')
    RegisterNetEvent('mm:data')
    AddEventHandler('mm:data', function(name2, weapon2, components2)
        local loadoutstable = {}
        table.insert(loadoutstable, name2)
        for k,v in pairs(loadoutstable) do

            local loadout = savedloadouts:AddButton({ icon = '🏷️', label = v, value = customize, description = data.config.bottomText })
            loadout:On('select', function(item,  value)
                for k,v in pairs(data) do
                    if IsWeaponValid(GetHashKey(k)) then
                        RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(k))
                        ShowNotification("Spawned All Weapons")
                    end
                end
                for k,v in pairs(defaultdata) do
                    if IsWeaponValid(GetHashKey(k)) then
                        RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(k))
                    end
                end
                str = weapon2
                comp = components2
                for word in string.gmatch(str, '([^,]+)') do
                    hash = word
                    hash = hash:gsub('%"', '')
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 500, true, true)
                    for word2 in string.gmatch(comp, '([^,]+)') do
                        hash2 = word2
                        hash2 = hash2:gsub('%"', '')
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(hash), GetHashKey(hash2))
                    end
                end
            end)
        end
    end)

    
end

createMenu()

if data.config.hotkey.enabled == true then
    RegisterKeyMapping(data.config.command, "MarkoMods Weapons Menu", 'keyboard', data.config.hotkey.key)
end
RegisterCommand(data.config.command, function(source, args, RawCommand)
    local ped = GetPlayerPed(-1)
    MenuV:OpenMenu(menu)
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end