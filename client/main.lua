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
        exports['rsg-core']:createPrompt(mining.location, mining.coords, RSGCore.Shared.Keybinds['J'], 'Start ' .. mining.name, {
            type = 'client',
            event = 'jp-mining:client:StartMining'
        })
        if mining.showblip == true then
            local MiningBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, mining.coords)
            SetBlipSprite(1220803671)
            SetBlipScale(MiningBlip)
            Citizen.InvokeNative(0x9CB1A1623062F402, MiningBlip, mining.name)
        end
    end
end)

RegisterNetEvent('jp-mining:client:StartMining', function()
    local player = PlayerPedId()
    local hasItem = RSGCore.Functions.HasItem('pickaxe', 1)
    local chance = math.random(1, 100)
    
    if isMining == false then
        if chance <= 25 then
            TriggerServerEvent('jp-mining:server:breakpickaxe')
            RSGCore.Functions.Notify('You broke your pickaxe!', 'error', 5000)
        else
            if hasItem then
                local numberGenerator = math.random(1, 100)
                if numberGenerator > 85 then
                    TriggerServerEvent('jp-mining:server:removeitem')
                else
                    local coords = GetEntityCoords(player)
                    local boneIndex = GetEntityBoneIndexByName(player, "SKEL_R_Finger00")
                    local pickaxe = CreateObject(GetHashKey("p_pickaxe01x"), coords, true, true, true)
                    local miningTime = math.random(15000, 25000)
                    isMining = true

                    SetCurrentPedWeapon(player, "WEAPON_UNARMED", true)
                    FreezeEntityPosition(player, true)
                    ClearPedTasksImmediately(player)
                    AttachEntityToEntity(pickaxe, player, boneIndex, -0.35, -0.21, -0.39, -8.0, 47.0, 11.0, true, false, true, false, 0, true)

                    TriggerEvent('jp-mining:client:MineAnimation')

                    RSGCore.Functions.Progressbar("mining", "Mining...", math.random(12000, 18000), false, true,
                    {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        ClearPedTasksImmediately(player)
                        FreezeEntityPosition(player, false)

                        TriggerServerEvent('jp-mining:server:givestone')

                        SetEntityAsNoLongerNeeded(pickaxe)
                        DeleteEntity(pickaxe)
                        DeleteObject(pickaxe)

                        isMining = false
                    end)
                end
            else
                RSGCore.Functions.Notify('You don\'t have a pickaxe!', 'error')
            end
        end
    else
        RSGCore.Functions.Notify('You are already doing something!', 'primary')
    end
end)

AddEventHandler('jp-mining:client:MineAnimation', function()
    local player = PlayerPedId()

    LoadAnimDict(mineAnimation)
    Wait(100)
    TaskPlayAnim(player, mineAnimation, anim, 3.0, 3.0, -1, 1, 0, false, false, false)
end)