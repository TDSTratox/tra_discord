ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('tra_discord:getPlayerName', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local firstName = xPlayer.get('firstName') or "Inconnu"
        local lastName = xPlayer.get('lastName') or "Inconnu"
        cb(firstName .. " " .. lastName)
    else
        cb(nil)
    end
end)
