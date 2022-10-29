local QBCore = exports['qb-core']:GetCoreObject()

local function startPopCorn(entity)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "popcorn", 0.3)
    QBCore.Functions.Progressbar("PopCorn", Lang:t("popcorns.popcorn_animation_label"), Config.Time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 49,
    }, {}, {}, function()
        if DoesEntityExist(entity) then
            local pos = GetEntityCoords(entity)
            local objectCoords = pos.x .. pos.y .. pos.z
            TriggerServerEvent("th-popcorn:server:poped", objectCoords)
            QBCore.Functions.Notify(Lang:t("popcorns.popcorn_ready"), "primary")
        end
    end, function()
        Lang:t("popcorns.popcorn_animation_canceled")
    end)
end

CreateThread(function()
    exports['qb-target']:AddTargetModel(
        Config.Modellek, 
        {
            options = {
                {
                    targeticon = 'fa-solid fa-screwdriver-wrench', 
                    icon = "fas fa-mask",
                    type = "client",
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent('th-popcorn:client:pop', entity)
                    end,
                    label = Lang:t("popcorns.target_label"),
                    item = Config.Item,
                }
            },
            distance = Config.Tavolsag,
        }
    )
end)

RegisterNetEvent("th-popcorn:client:pop", function(entity)
    local pos = GetEntityCoords(entity)
    local objectCoords = pos.x .. pos.y .. pos.z
	QBCore.Functions.TriggerCallback('th-popcorn:server:getbpop', function()
	startPopCorn(entity)
    end, objectCoords)
end)