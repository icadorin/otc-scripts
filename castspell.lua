-- Configurações da Spell
local spellName = "divinidade-ja"
local spellCount = 6
local minManaPercent = 50  -- Porcentagem mínima de mana para lançar a magia
local minDistance = 5 -- Distância mínima entre o jogador e a criatura em células

UI.Separator()
UI.Label("Spell")
UI.TextEdit(spellName, function(widget, text)
    spellName = text
end)

UI.Label("Quantidade")
UI.TextEdit(tostring(spellCount), function(widget, text)
    spellCount = tonumber(text)
end)

UI.Label("% min. de mana")
UI.TextEdit(tostring(minManaPercent), function(widget, text)
    minManaPercent = tonumber(text)
end)

UI.Label("Distância mínima")
UI.TextEdit(tostring(minDistance), function(widget, text)
    minDistance = tonumber(text)
end)

UI.Separator()

macro(1000, "UE Spell", function()
    local localPlayer = g_game.getLocalPlayer()
    if not localPlayer then
        return
    end

    local playerPos = localPlayer:getPosition()
    if not playerPos then
        return
    end

    local monsters = 0

    for _, creature in ipairs(g_map.getSpectators(playerPos, false)) do
        if creature:isMonster() then
            local creaturePos = creature:getPosition()
            if creaturePos then
                local distance = 0  -- Inicializa a distância com 0
                if playerPos and playerPos.x and playerPos.y and creaturePos and creaturePos.x and creaturePos.y then
                    local deltaX = playerPos.x - creaturePos.x
                    local deltaY = playerPos.y - creaturePos.y
                    distance = math.floor(math.sqrt(deltaX^2 + deltaY^2))
                end

                if distance and distance <= minDistance then
                    monsters = monsters + 1
                end
            end
        end
    end

    if monsters > 0 and monsters >= spellCount and spellName ~= "" then
        if manapercent() >= minManaPercent then
            say(spellName)
        end
    end
end)
