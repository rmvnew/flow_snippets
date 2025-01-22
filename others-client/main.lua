-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VRP
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","flow_snippets")

src = {}
Tunnel.bindInterface("flow_snippets",src)
vSERVER = Tunnel.getInterface("flow_snippets")


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local segundos = 0
local trancas = config.doors

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE TRANCAS
-----------------------------------------------------------------------------------------------------------------------------------------


-- Citizen.CreateThread(function()
-- 	while true do
-- 		local time = 1000
-- 		local pedCoords = GetEntityCoords(PlayerPedId())
		
-- 		for k,v in pairs(trancas) do
-- 			local distance = #(pedCoords - v.coords)
-- 			if distance <= v.distance then
-- 				time = 5
-- 				if trancas[k].trancado[1] and trancas[k].text[1] then
-- 					DrawText3Ds(v.coords[1],v.coords[2],v.coords[3], "[PORTA]: ~r~TRANCADA")
-- 				else
-- 					DrawText3Ds(v.coords[1],v.coords[2],v.coords[3], "[PORTA]: ~g~DESTRANCADA")
-- 				end

-- 				-- if distance <= 1.5 then
-- 					if IsControlJustPressed(0,38) and segundos <= 0 then
-- 						segundos = 5
-- 						if trancas[k].trancado[1] then
-- 							vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
-- 							Citizen.Wait(2200)
-- 							if vSERVER.syncLock(k, false, trancas[k].perm[1]) then
-- 								TriggerEvent("Notify","importante","Porta destrancada.", 5)
-- 							end
-- 						else
-- 							vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
-- 							Citizen.Wait(2200)
-- 							if vSERVER.syncLock(k, true, trancas[k].perm[1]) then
-- 								TriggerEvent("Notify","sucesso","Porta trancada.", 5)
-- 							end
-- 						end
-- 					end
-- 				-- end

-- 			end
-- 		end
	
-- 		Citizen.Wait(time)
-- 	end
-- end)


-- teste1 funcionou +/-


-- -- SISTEMA DE TRANCAS
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- local sprites = {
--     [0] = { 'mpsafecracking', 'lock_open', 0, 0, 0.018, 0.018, 0, 0, 255, 0, 255 },
--     [1] = { 'mpsafecracking', 'lock_closed', 0, 0, 0.018, 0.018, 0, 255, 0, 0, 255 },
-- }

-- local function drawSprite(lockCoords, sprite)
--     SetDrawOrigin(lockCoords[1], lockCoords[2], lockCoords[3])
--     DrawSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5], sprite[6] * GetAspectRatio(true), sprite[7], sprite[8], sprite[9], sprite[10], sprite[11])
--     ClearDrawOrigin()
-- end

-- Citizen.CreateThread(function()
--     RequestStreamedTextureDict(sprites[0][1], true)
--     RequestStreamedTextureDict(sprites[1][1], true)
-- 	while true do
-- 		local time = 1000
-- 		local pedCoords = GetEntityCoords(PlayerPedId())
		
-- 		for k,v in pairs(trancas) do
-- 			local distance = #(pedCoords - v.coords)
-- 			if distance <= v.distance then
-- 				time = 5
--                 local lockState = (trancas[k].trancado[1] and 1 or 0)
--                 local sprite = sprites[lockState]
--                 drawSprite(v.coords, sprite)

-- 				-- if distance <= 1.5 then
-- 					if IsControlJustPressed(0,38) and segundos <= 0 then
-- 						segundos = 5
-- 						if trancas[k].trancado[1] then
-- 							vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
-- 							Citizen.Wait(2200)
-- 							if vSERVER.syncLock(k, false, trancas[k].perm[1]) then
-- 								TriggerEvent("Notify","importante","Porta destrancada.", 5)
-- 							end
-- 						else
-- 							vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false)
-- 							Citizen.Wait(2200)
-- 							if vSERVER.syncLock(k, true, trancas[k].perm[1]) then
-- 								TriggerEvent("Notify","sucesso","Porta trancada.", 5)
-- 							end
-- 						end
-- 					end
-- 				-- end

-- 			end
-- 		end
	
-- 		Citizen.Wait(time)
-- 	end
-- end)


-- SISTEMA DE TRANCAS
-----------------------------------------------------------------------------------------------------------------------------------------
local sprites = {
    [0] = { 'mpsafecracking', 'lock_open', 0, 0, 0.018, 0.018, 0, 0, 255, 0, 255 },
    [1] = { 'mpsafecracking', 'lock_closed', 0, 0, 0.018, 0.018, 0, 255, 0, 0, 255 },
}

local function drawSprite(lockCoords, sprite)
    SetDrawOrigin(lockCoords[1], lockCoords[2], lockCoords[3])
    DrawSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5], sprite[6] * GetAspectRatio(true), sprite[7], sprite[8], sprite[9], sprite[10], sprite[11])
    ClearDrawOrigin()
end

local doors = config.doors -- Define a variável doors com os dados do config




-- Citizen.CreateThread(function()
--     RequestStreamedTextureDict(sprites[0][1], true)
--     RequestStreamedTextureDict(sprites[1][1], true)
--     while true do
--         local time = 1000
--         local pedCoords = GetEntityCoords(PlayerPedId())

--         for k, v in pairs(trancas) do
--             if doors[k] then -- Verifica se a porta está definida no arquivo config
--                 local configDoor = doors[k]
--                 -- Calcula distância apenas em X e Y
--                 local distance = #(vector2(pedCoords.x, pedCoords.y) - vector2(configDoor.coords.x, configDoor.coords.y))

--                 if k == 220 then
--                     print(string.format("[DEBUG] Porta: %d | Distância: %.2f | Configuração: %.2f", k, distance, configDoor.distance))
--                 end

--                 if distance <= configDoor.distance then
--                     time = 5
--                     local lockState = (v.trancado[1] and 1 or 0)
--                     local sprite = sprites[lockState]
--                     drawSprite(configDoor.coords, sprite)

--                     -- Permitir abrir ou trancar a porta dentro da distância
--                     if IsControlJustPressed(0, 38) and segundos <= 0 then
--                         segundos = 5
--                         vRP._playAnim(true, {{"veh@mower@base", "start_engine"}}, false)
--                         Citizen.Wait(2200)

--                         -- Alterna o estado da tranca
--                         local novoEstado = not v.trancado[1]
--                         if vSERVER.syncLock(k, novoEstado, v.perm[1]) then
--                             v.trancado[1] = novoEstado -- Atualiza o estado local da tranca
--                             if v.trancado[1] then
--                                 TriggerEvent("Notify", "sucesso", "Porta trancada.", 5)
--                             else
--                                 TriggerEvent("Notify", "importante", "Porta destrancada.", 5)
--                             end
--                         else
--                             TriggerEvent("Notify", "negado", "Falha ao sincronizar o estado da porta.", 5)
--                         end
--                     end
--                 end
--             else
--                 print(string.format("[DEBUG] Porta %d não configurada em doors", k))
--             end
--         end

--         Citizen.Wait(time)
--     end
-- end)


-- -- Thread principal para gerenciar a lógica das portas
-- Citizen.CreateThread(function()
--     -- Solicita os sprites usados para desenhar o estado das portas (trancado/destrancado)
--     RequestStreamedTextureDict(sprites[0][1], true)
--     RequestStreamedTextureDict(sprites[1][1], true)

--     while true do
--         local time = 1000 -- Define o tempo de espera padrão como 1000ms (1 segundo)

--         -- Obtém as coordenadas atuais do jogador
--         local pedCoords = GetEntityCoords(PlayerPedId())

--         -- Itera sobre todas as trancas configuradas
--         for k, v in pairs(trancas) do
--             -- Verifica se a porta correspondente existe no arquivo de configuração
--             if doors[k] then
--                 local configDoor = doors[k] -- Dados da porta no arquivo de configuração

--                 -- Calcula a distância apenas nos eixos X e Y (ignorando a altura Z)
--                 local distance = #(vector2(pedCoords.x, pedCoords.y) - vector2(configDoor.coords.x, configDoor.coords.y))

--                 -- Depuração: Exibe informações específicas da porta 220 no console
--                 if k == 220 then
--                     print(string.format("[DEBUG] Porta: %d | Distância: %.2f | Configuração: %.2f", k, distance, configDoor.distance))
--                 end

--                 -- Verifica se o jogador está dentro da distância configurada para a porta
--                 if distance <= configDoor.distance then
--                     time = 5 -- Reduz o tempo de espera para 5ms enquanto o jogador estiver próximo

--                     -- Determina o estado atual da porta (0 para destrancado, 1 para trancado)
--                     local lockState = (v.trancado[1] and 1 or 0)
--                     local sprite = sprites[lockState] -- Obtém o sprite correspondente ao estado atual

--                     -- Desenha o sprite sobre a porta
--                     drawSprite(configDoor.coords, sprite)

--                     -- Verifica se o jogador pressionou a tecla E (código 38) e se não há tempo de espera
--                     if IsControlJustPressed(0, 38) and segundos <= 0 then
--                         segundos = 5 -- Define o tempo de espera para 5 segundos
--                         -- Executa uma animação ao interagir com a porta
--                         vRP._playAnim(true, {{"veh@mower@base", "start_engine"}}, false)
--                         Citizen.Wait(2200) -- Aguarda 2,2 segundos para simular a interação

--                         -- Alterna o estado da tranca (se estiver trancada, destranca, e vice-versa)
--                         local novoEstado = not v.trancado[1]

--                         -- Solicita ao servidor que sincronize o novo estado da porta
--                         if vSERVER.syncLock(k, novoEstado, v.perm[1]) then
--                             v.trancado[1] = novoEstado -- Atualiza o estado local da porta
--                             if v.trancado[1] then
--                                 -- Notifica o jogador que a porta foi trancada
--                                 TriggerEvent("Notify", "sucesso", "Porta trancada.", 5)
--                             else
--                                 -- Notifica o jogador que a porta foi destrancada
--                                 TriggerEvent("Notify", "importante", "Porta destrancada.", 5)
--                             end
--                         else
--                             -- Caso a sincronização com o servidor falhe, notifica o jogador
--                             TriggerEvent("Notify", "negado", "Falha ao sincronizar o estado da porta.", 5)
--                         end
--                     end
--                 end
--             else
--                 -- Depuração: Exibe no console se a porta não está configurada no arquivo `doors`
--                 print(string.format("[DEBUG] Porta %d não configurada em doors", k))
--             end
--         end

--         -- Aguarda pelo tempo definido antes de continuar o loop
--         Citizen.Wait(time)
--     end
-- end)


Citizen.CreateThread(function()
    -- Carrega os sprites usados para mostrar o estado das trancas
    RequestStreamedTextureDict(sprites[0][1], true)
    RequestStreamedTextureDict(sprites[1][1], true)

    while true do
        local time = 1000 -- Define o tempo de espera padrão como 1000ms (1 segundo)
        local pedCoords = GetEntityCoords(PlayerPedId()) -- Obtém as coordenadas do jogador

        for k, v in pairs(trancas) do
            if doors[k] then -- Verifica se a porta está configurada
                local configDoor = doors[k]
                -- Calcula a distância apenas em X e Y para evitar problemas com diferenças de altura
                local distance = #(vector2(pedCoords.x, pedCoords.y) - vector2(configDoor.coords.x, configDoor.coords.y))

                -- Exibe o sprite da fechadura a 1 metro além da distância configurada
                if distance <= (configDoor.distance + 1.0) then
					time = 5 -- Reduz o tempo de espera para 5ms enquanto o jogador estiver próximo
                    local lockState = (v.trancado[1] and 1 or 0)
                    local sprite = sprites[lockState]
                    drawSprite(configDoor.coords, sprite)
                end

                -- Permite interação apenas dentro da distância configurada
                if distance <= configDoor.distance then

                    if IsControlJustPressed(0, 38) and segundos <= 0 then
                        segundos = 5 -- Define o tempo de espera para 5 segundos
                        vRP._playAnim(true, {{"veh@mower@base", "start_engine"}}, false) -- Executa a animação
                        Citizen.Wait(2200) -- Aguarda 2,2 segundos para simular a interação

                        -- Alterna o estado da tranca
                        local novoEstado = not v.trancado[1]

                        -- Sincroniza o novo estado da tranca com o servidor
                        if vSERVER.syncLock(k, novoEstado, v.perm[1]) then
                            v.trancado[1] = novoEstado -- Atualiza o estado local da porta
                            if v.trancado[1] then
                                TriggerEvent("Notify", "sucesso", "Porta trancada.", 5)
                            else
                                TriggerEvent("Notify", "importante", "Porta destrancada.", 5)
                            end
                        else
                            -- Notifica em caso de falha na sincronização
                            TriggerEvent("Notify", "negado", "Falha ao sincronizar o estado da porta.", 5)
                        end
                    end
                end
            end
        end

        Citizen.Wait(time) -- Aguarda pelo tempo definido antes de continuar o loop
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCRONIZAR PORTAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 500
		local pedCoords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(trancas) do
			local distance = #(pedCoords - v.coords)
			if distance <= 20.0 then
				local door = GetClosestObjectOfType(v.coords[1],v.coords[2],v.coords[3],5.0,trancas[k].hash[1],false,false,false)
				SetEntityCanBeDamaged(door,false)
				if v.trancado[1] == false then
					NetworkRequestControlOfEntity(door)
					FreezeEntityPosition(door,false)
				else
					local lock,heading = GetStateOfClosestDoorOfType(v.hash[1],v.coords[1],v.coords[2],v.coords[3],lock,heading)
					if heading > -0.02 and heading < 0.02 then
						NetworkRequestControlOfEntity(door)
						FreezeEntityPosition(door,true)
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)


function src.setLock(id, status)
	if id then
		trancas[id].trancado[1] = status
	end
end

function src.syncAllLock(value)
	for k in pairs(value) do
		trancas[k].trancado[1] = value[k]
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE ELEVADOR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		
		for k,v in pairs(config.locationElevador) do
			local distance = #(playercoords - v.coords)
			if distance <= 2.0 then
				time = 5
				DrawMarker(20,v.coords[1],v.coords[2],v.coords[3]-0.7,0,0,0,0,0,130.0,0.4,0.1,0.5, 12,198,254,180 ,1,0,0,1)

				if IsControlJustReleased(1, 51) then
					if config.elevador[v.type] ~= nil then
						openElevador(v.type, v.andar, config.elevador[v.type].andares)
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)

function openElevador(tipo, andar, elevador)
	SetNuiFocus(true,true)
	SendNUIMessage({ showmenu = true, tipo = tipo, andar = andar, elevador = elevador })
end

function updateElevador(tipo, andar)
	local ped = PlayerPedId()
	DoScreenFadeOut(1000)

	Wait(1000)
	SetEntityCoordsNoOffset(ped,config.elevador[tipo].andares[andar][1],config.elevador[tipo].andares[andar][2],config.elevador[tipo].andares[andar][3], true,true,true)

	Wait(1000)
	SetNuiFocus(false)
	SendNUIMessage({ hidemenu = true })

	Wait(1000)
	DoScreenFadeIn(1000)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALL BACKS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeNui",function(data,cb)
	SetNuiFocus(false)
	SendNUIMessage({ hidemenu = true })
end)

RegisterNUICallback("elevadorInit",function(data,cb)
	if segundos <= 0 then
		segundos = 5
		updateElevador(data.elevador, data.andar)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrp_sound:source')
AddEventHandler('vrp_sound:source',function(sound,volume)
	SendNUIMessage({ transactionType = 'playSound', transactionFile = sound, transactionVolume = volume })
end)

RegisterNetEvent('vrp_sound:distance')
AddEventHandler('vrp_sound:distance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if (distIs <= maxDistance) then
        SendNUIMessage({ transactionType = 'playSound', transactionFile = soundFile, transactionVolume = soundVolume })
    end
end)  

RegisterNetEvent('vrp_sound:fixed')
AddEventHandler('vrp_sound:fixed',function(playerid,x2,y2,z2,maxdistance,sound,volume)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local distance = GetDistanceBetweenCoords(x2,y2,z2,x,y,z,true)
	if distance <= maxdistance then
		SendNUIMessage({ transactionType = 'playSound', transactionFile = sound, transactionVolume = volume })
	end
end) 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS NO MAPA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for k,v in pairs(config.blips) do
		local blip = AddBlipForCoord(v[1]+0.001,v[2]+0.001,v[3]+0.001)
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
	end
end)

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONTADOR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		if segundos > 0 then
			segundos = segundos - 1
			
			if segundos <= 0 then
				segundos = 0
			end

		end
		Citizen.Wait(time)
	end
end)