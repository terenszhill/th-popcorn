local QBCore = exports['qb-core']:GetCoreObject()
local PopedCorn = {}

local function givePopCornToPlayer()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  for _ = 1, math.random(Config.MinItemsReceived, Config.MaxItemsReceived), 1 do
    local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
    local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
    Player.Functions.AddItem(randItem, 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
    Player.Functions.RemoveItem(Config.Item, 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Item], "remove")
    Wait(500)
  end
end

RegisterServerEvent('th-popcorn:server:poped', function(objectCoords)
	PopedCorn[objectCoords] = true
  givePopCornToPlayer()
end)

QBCore.Functions.CreateCallback('th-popcorn:server:getbpop', function(source, cb, objectCoords)
  local objectCoords = objectCoords
	cb(PopedCorn[objectCoords])
end)