local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('jp-mining:server:givestone')
AddEventHandler('jp-mining:server:givestone', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    local rock = math.random(1, 3)
    local playername = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid

    Player.Functions.AddItem('rock', rock)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['rock'], "add")

    if chance <= 50 then
        local salt = math.random(1, 3)
        Player.Functions.AddItem('rocksalt', salt)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['coal'], "add")

        local webhookUrl = ""

        local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nMined: %s\nOres: %s", playername, citizenid, salt .. " and, " .. rock, 'rocksalt, rock')
        local discordPayload = {
            embeds = {
                {
                    title = "Mining",
                    description = discordMessage,
                    color = 16711680 -- Red color in decimal format
                }
            }
        }
            
        PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterServerEvent('jp-mining:server:washrocks')
AddEventHandler('jp-mining:server:washrocks', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    local checkItem = Player.Functions.GetItemByName('rock')
    local item = CONFIG.RareAward[math.random(1, #CONFIG.RareAward)]
    local item2 = CONFIG.UncommonAward[math.random(1, #CONFIG.UncommonAward)]
    local item3 = CONFIG.Normal[math.random(1, #CONFIG.Normal)]
    local playername = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid

    if chance <= 5 then
        if checkItem.amount >= 3 then
            local ore = math.random(1, 3)
            local remaining = 0
            Player.Functions.RemoveItem('rock', 3)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['rock'], "remove")
            Player.Functions.AddItem(item, ore)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "add")

            if ore <= 2 then
                remaining = 3 - ore
                Player.Functions.AddItem('stone', remaining)
                TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['stone'], "add")

                local webhookUrl = ""

                local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, ore .. " and, " .. remaining, item .. ", stone")
                local discordPayload = {
                    embeds = {
                        {
                            title = "Mining",
                            description = discordMessage,
                            color = 16711680 -- Red color in decimal format
                        }
                    }
                }
            
                PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
            else
                local webhookUrl = ""

                local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, ore, item)
                local discordPayload = {
                    embeds = {
                        {
                            title = "Mining",
                            description = discordMessage,
                            color = 16711680 -- Red color in decimal format
                        }
                    }
                }
            
                PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
            end
        elseif checkItem.amount <= 2 then
            Player.Functions.RemoveItem('rock', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['rock'], "remove")
            Player.Functions.AddItem(item, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "add")

            local webhookUrl = ""

            local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, '1', item)
            local discordPayload = {
                embeds = {
                    {
                        title = "Mining",
                        description = discordMessage,
                        color = 16711680 -- Red color in decimal format
                    }
                }
            }
            
            PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
        end
    elseif chance > 5 and chance <= 30 then
        if checkItem.amount >= 3 then
            local ore = math.random(1, 3)
            local remaining = 0
            Player.Functions.RemoveItem('rock', 3)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['rock'], "remove")
            Player.Functions.AddItem(item2, ore)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item2], "add")

            if ore <= 2 then
                remaining = 3 - ore
                Player.Functions.AddItem('stone', remaining)
                TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['stone'], "add")

                local webhookUrl = ""

                local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, ore .. " and, " .. remaining, item2 .. ", stone")
                local discordPayload = {
                    embeds = {
                        {
                            title = "Mining",
                            description = discordMessage,
                            color = 16711680 -- Red color in decimal format
                        }
                    }
                }
            
                PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
            else
                local webhookUrl = ""

                local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, ore, item2)
                local discordPayload = {
                    embeds = {
                        {
                            title = "Mining",
                            description = discordMessage,
                            color = 16711680 -- Red color in decimal format
                        }
                    }
                }
            
                PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
            end
        elseif checkItem.amount <= 2 then
            Player.Functions.RemoveItem('rock', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['rock'], "remove")
            Player.Functions.AddItem(item2, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item2], "add")

            local webhookUrl = ""

            local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, '1', item2)
            local discordPayload = {
                embeds = {
                    {
                        title = "Mining",
                        description = discordMessage,
                        color = 16711680 -- Red color in decimal format
                    }
                }
            }
            
            PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
        end
    elseif chance > 30 then
        if checkItem.amount >= 3 then
            local ore = math.random(1, 3)
            local remaining = 0
            Player.Functions.RemoveItem('rock', 3)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['rock'], "remove")
            Player.Functions.AddItem(item3, ore)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item3], "add")

            if ore <= 2 then
                remaining = 3 - ore
                Player.Functions.AddItem('stone', remaining)
                TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['stone'], "add")

                local webhookUrl = ""

                local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, ore .. " and, " .. remaining, item3 .. ", stone")
                local discordPayload = {
                    embeds = {
                        {
                            title = "Mining",
                            description = discordMessage,
                            color = 16711680 -- Red color in decimal format
                        }
                    }
                }
            
                PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
            else
                local webhookUrl = ""

                local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, ore, item3)
                local discordPayload = {
                    embeds = {
                        {
                            title = "Mining",
                            description = discordMessage,
                            color = 16711680 -- Red color in decimal format
                        }
                    }
                }
            
                PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
            end
        elseif checkItem.amount <= 2 then
            Player.Functions.RemoveItem('rock', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['rock'], "remove")
            Player.Functions.AddItem(item3, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item3], "add")

            local webhookUrl = ""

            local discordMessage = string.format("**Mining**\nPlayer: %s\nCitizen ID: %s\nWashed Rock and got: %s\nOres: %s", playername, citizenid, '1', item3)
            local discordPayload = {
                embeds = {
                    {
                        title = "Mining",
                        description = discordMessage,
                        color = 16711680 -- Red color in decimal format
                    }
                }
            }
            
            PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
        end
    end
end)

RegisterServerEvent('jp-mining:server:breakpickaxe')
AddEventHandler('jp-mining:server:breakpickaxe', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local playername = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid

    Player.Functions.RemoveItem('pickaxe', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['pickaxe'], "remove")

    local webhookUrl = ""

    local discordMessage = string.format("**Mining**\nPlayer: %s\nBroke their: %s", playername, citizenid, 'Pickaxe')
    local discordPayload = {
        embeds = {
            {
                title = "Mining",
                description = discordMessage,
                color = 16711680 -- Red color in decimal format
            }
        }
    }
            
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(discordPayload), { ['Content-Type'] = 'application/json' })
end)
