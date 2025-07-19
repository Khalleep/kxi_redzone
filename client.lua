local redZones = {}
local isInsideRedzone = false

Citizen.CreateThread(function()
    for _, zoneData in ipairs(Config.Redzones) do
        local zone = lib.zones.sphere({
            coords = zoneData.coords,
            radius = zoneData.radius,
            debug = false,
            inside = function()
                if not isInsideRedzone then
                    isInsideRedzone = true
                    onEnterRedzone()
                end
            end,
            onExit = function()
                Citizen.SetTimeout(100, function()
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local stillInside = false
                    for _, z in ipairs(redZones) do
                        if z:contains(coords) then
                            stillInside = true
                            break
                        end
                    end
                    if not stillInside and isInsideRedzone then
                        isInsideRedzone = false
                        onExitRedzone()
                    end
                end)
            end
        })

        table.insert(redZones, zone)

        local blip = AddBlipForRadius(zoneData.coords.x, zoneData.coords.y, zoneData.coords.z, zoneData.radius)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, 128)
        SetBlipHighDetail(blip, true)
    end
end)

function onEnterRedzone()
    lib.notify({
        title = 'Redzone',
        description = 'You are in a redzone!',
        type = 'error',
        icon = 'exclamation-triangle',
        position = 'top-right'
    })
    addRedzoneTarget()
end

function onExitRedzone()
    lib.notify({
        title = 'Redzone',
        description = 'You have left the redzone.',
        type = 'inform',
        icon = 'circle-check',
        position = 'top-right'
    })
    removeRedzoneTarget()
end

function addRedzoneTarget()
    exports.ox_target:addGlobalPlayer({
        id = 'redzone_loot',
        label = 'Loot',
        icon = 'fas fa-box-open',
        distance = 2.5,
        canInteract = function(entity)
            return IsEntityDead(entity) and isEntityInAnyRedZone(entity)
        end,
        onSelect = function()
            exports.ox_inventory:openNearbyInventory()
        end
    })
end

function removeRedzoneTarget()
    exports.ox_target:removeGlobalPlayer('redzone_loot')
end

function isEntityInAnyRedZone(entity)
    if not entity or not DoesEntityExist(entity) then return false end
    local coords = GetEntityCoords(entity)
    for _, zone in ipairs(redZones) do
        if zone:contains(coords) then
            return true
        end
    end
    return false
end