--------------------------
--- DiscordWeaponPerms ---
--------------------------
restrictedWeapons = {
{"WEAPON_MINIGUN", "WEAPON_RAILGUN", "WEAPON_RAYPISTOL", "WEAPON_RAYCARBINE", "WEAPON_RAYMINIGUN",}, -- Alien (1)
{"WEAPON_APPISTOL", "WEAPON_MILITARYRIFLE", "WEAPON_ASSAULTSHOTGUN", "WEAPON_PISTOL_MK2", "WEAPON_SMG_MK2", "WEAPON_COMBATMG_MK2", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE_MK2", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_SNSPISTOL_MK2", "WEAPON_REVOLVER_MK2", "WEAPON_SPECIALCARBINE_MK2", "WEAPON_BULLPUPRIFLE_MK2", "WEAPON_PUMPSHOTGUN_MK2", "WEAPON_MARKSMANRIFLE_MK2",}, -- mk2 (2)    
{"WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_FLARE", "WEAPON_STUNGUN", "WEAPON_NIGHTSTICK", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE",}, -- leo (3)
{"WEAPON_RPG", "WEAPON_FIREWORK", "WEAPON_GRENADELAUNCHER", "WEAPON_HOMINGLAUNCHER", "WEAPON_COMPACTLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PIPEBOMB", "WEAPON_passenger_rocket", "WEAPON_PROXMINE",}, -- explosive (4)
{"WEAPON_stinger", "WEAPON_STONE_HATCHET", "WEAPON_MOLOTOV",}, -- black (5)
{"WEAPON_HATCHET",}, -- pedwhitelist (6)
{"WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_MARKSMANRIFLE",}, -- heavywep (7)
{"weapon_flashbang", "WEAPON_FLASHBANG",}, -- SWAT (8)
{"weapon_g17", "WEAPON_PP19", "weapon_mp9a", "WEAPON_M9", "WEAPON_benellim2", "WEAPON_RPK16", "weapon_hk416b", "weapon_m4v1", "weapon_m700", "WEAPON_M45A1", "WEAPON_M870", "weapon_mk18b", "WEAPON_MPX", "WEAPON_MCX", "weapon_p226", "WEAPON_AXMC", "WEAPON_M700a", "WEAPON_MINIUZI",}, -- weaponpack (9)
}
--[[
Weapon components list: https://wiki.rage.mp/index.php?title=Weapons_Components
Weapon list: https://runtime.fivem.net/doc/natives/#_0xBF0FD6E56C964FCB
]]--
isAllowed = {}
RegisterNetEvent('DiscordWeaponPerms:CheckPerms:Return')
AddEventHandler('DiscordWeaponPerms:CheckPerms:Return', function(hasPerms)
	isAllowed = hasPerms
end)
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
alreadyRan = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4000)
		if not alreadyRan then
			TriggerServerEvent("DiscordWeaponPerms:CheckPerms")
			alreadyRan = true
		end
		--TriggerServerEvent("Print:PrintDebug", "It gets here 1") -- DEBUG - GET RID OF
		local ped = GetPlayerPed(-1)
		local weapon = GetSelectedPedWeapon(ped)
		local restrictedStr = ""
		local requiredPerm = nil
		for i=1, #restrictedWeapons do
			local weaponArr = restrictedWeapons[i]
			for j=1, #weaponArr do
				-- Check if the weapon is restricted and for what group, or if it's the attachment
				if weapon == GetHashKey(weaponArr[j]) then
					-- This weapon is restricted unless they have this role perm
					requiredPerm = i
					restrictedStr = weaponArr[j]
					break
				elseif (HasPedGotWeaponComponent(ped, weapon, GetHashKey(weaponArr[j]))) then
					-- It's restricted unless they have this role perm
					requiredPerm = i
					restrictedStr = weaponArr[j]
					break
				end
			end
		end
		--TriggerServerEvent("Print:PrintDebug", "It gets here 2") -- DEBUG - GET RID OF
		-- Check their perms
		if not has_value(isAllowed, requiredPerm) and requiredPerm ~= nil then
			-- Does not have perms to use this
			RemoveWeaponFromPed(ped, weapon)
			DisplayNotification("~r~Restricted: ~w~" .. restrictedStr)
		end
		--TriggerServerEvent("Print:PrintDebug", "It gets here 3") -- DEBUG - GET RID OF
	end
end)

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end