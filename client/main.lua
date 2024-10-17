local RSGCore = exports['rsg-core']:GetCoreObject()
local PlayerData = RSGCore.Functions.GetPlayerData()
local mineAnimation = 'amb_work@world_human_pickaxe@wall@male_d@base'
local anim = 'base'

local isMining = false

local LoadAnimDict = function(dict)
    local isLoaded = HasAnimDictLoaded(dict)

    while not isLoaded do
        RequestAnimDict(dict)
        Wait(5)
        isLoaded = not isLoaded
    end
end

Citizen.CreateThread(function()
    for _, mining in pairs(CONFIG.MiningLocations) do
        exports['rsg-core']:createPrompt(mining.location, mining.coords, RSGCore.Shared.Keybinds['E'],
            'Start ' .. mining.name, {
                type = 'client',
                event = 'jp-mining:client:StartMining'
            })
        if mining.showblip == true then
            local MiningBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, mining.coords)
            SetBlipSprite(MiningBlip, 1220803671)
            SetBlipScale(MiningBlip, 1.0)
            Citizen.InvokeNative(0x9CB1A1623062F402, MiningBlip, mining.name)
        end
    end
end)

RegisterNetEvent('jp-mining:client:StartMining', function()
    local player = PlayerPedId()
    local hasItem = RSGCore.Functions.HasItem('pickaxe', 1)
    local chance = math.random(1, 100)

    if isMining == false then
        if hasItem then
            local numberGenerator = math.random(1, 100)
            if numberGenerator <= 5 then
                TriggerServerEvent('jp-mining:server:breakpickaxe')
            else
                local coords = GetEntityCoords(player)
                local boneIndex = GetEntityBoneIndexByName(player, "SKEL_R_Finger00")
                local pickaxe = CreateObject(GetHashKey("p_pickaxe01x"), coords.x, coords.y, coords.z, true, true, false)
                isMining = true

                SetCurrentPedWeapon(player, "WEAPON_UNARMED", true)
                FreezeEntityPosition(player, true)
                ClearPedTasksImmediately(player)
                AttachEntityToEntity(pickaxe, player, boneIndex, -0.35, -0.21, -0.39, -8.0, 47.0, 11.0, true, false, true,
                    false, 0, true)

                TriggerEvent('jp-mining:client:MineAnimation')

                lib.progressBar({
                    duration = CONFIG.MiningDuration,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = false,
                    disableControl = true,
                    disable = {
                        move = true,
                        car = true,
                        mouse = true,
                        combat = true,
                    },
                    anim = {
                        dict = mineAnimation,
                        clip = 'base',
                        flag = 1,
                    },
                    label = 'Mining...',
                })
                ClearPedTasksImmediately(player)
                FreezeEntityPosition(player, false)

                TriggerServerEvent('jp-mining:server:givestone')

                SetEntityAsNoLongerNeeded(pickaxe)
                DeleteEntity(pickaxe)
                DeleteObject(pickaxe)

                isMining = false
            end
        else
            lib.notify({ title = 'Error', description = 'You don\'t have a pickaxe!', type = 'error', duration = 5000 })
        end
    else
        lib.notify({ title = 'Error', description = 'You are already doing something!', type = 'warning', duration = 5000 })
    end
end)

AddEventHandler('jp-mining:client:MineAnimation', function()
    local player = PlayerPedId()

    LoadAnimDict(mineAnimation)
    Wait(100)
    TaskPlayAnim(player, mineAnimation, anim, 3.0, 3.0, -1, 1, 0, false, false, false)
end)
