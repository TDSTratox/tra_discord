ESX = exports["es_extended"]:getSharedObject()

-- 📌 Remplace "TON_CLIENT_ID" par l'ID de ton application Discord
SetDiscordAppId("TON_CLIENT_ID")

-- 📌 Image principale (ajoute-la dans le Discord Developer Portal > Rich Presence > Art Assets)
SetDiscordRichPresenceAsset("logo") 
SetDiscordRichPresenceAssetText("Mon Serveur FiveM")

-- Fonction pour mettre à jour la présence Discord
local function UpdateRichPresence()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local zoneName = GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)
    local location = GetLabelText(zoneName) or "Lieu inconnu"

    ESX.TriggerServerCallback('tra_discord:getPlayerName', function(fullName)
        if fullName then
            SetRichPresence(fullName .. " | " .. location)
        else
            SetRichPresence("En attente de connexion...")
        end
    end)
end

-- Boucle qui met à jour la présence toutes les 5 secondes
CreateThread(function()
    while true do
        UpdateRichPresence()
        Wait(5000) -- Met à jour toutes les 15 secondes
    end
end)
