ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RMenu.Add('poleemploi', 'main', RageUI.CreateMenu("Pole Emploi", "~b~Menu~s~ Pole Emploi"))
RMenu.Add('poleemploi', 'metier', RageUI.CreateMenu("Pole Emploi", "~b~Menu~s~ Metier"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('poleemploi', 'main'), true, true, true, function()
            RageUI.Button("---------------------- Liste des Métiers -------------------------", "Liste des Métiers", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
      -------------------------------------- Sous Menu ------------------------------------
      RageUI.Button("Métiers", "Liste des Métiers", {RightLabel = "→→→"}, true, function()
      end, RMenu:Get('poleemploi', 'metier'))


      RageUI.Button("------------------- Choisissez votre metier ---------------------", "Choisissez votre metier", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

    end, function()
    end)

    ------------------------------- Metier --------------------------------------------------------

    RageUI.IsVisible(RMenu:Get('poleemploi', 'metier'), true, true, true, function()
        RageUI.Button("~g~Travaillé~s~ : Mineur", "Travaillé Mineur", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('powx_joblisting:setJobMineur')

                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

                ESX.ShowAdvancedNotification('Pole Emploi', '~b~Annonce Pole Emploi', 'Vous etes désormais ~b~Mineur.', 'CHAR_ALL_PLAYERS_CONF', 8)
            end
        end)
        RageUI.Button("------------------------------------------------------------------------", "Choisissez votre metier", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("~g~Travaillé~s~ : Bûcheron", "Travaillé Bûcheron", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('powx_joblisting:setJobBûcheron')

                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

                ESX.ShowAdvancedNotification('Pole Emploi', '~b~Annonce Pole Emploi', 'Vous etes désormais ~b~Bûcheron.', 'CHAR_ALL_PLAYERS_CONF', 8)
            end
        end)
        RageUI.Button("------------------------------------------------------------------------", "Choisissez votre metier", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("~g~Travaillé~s~ : Abatteur", "Travaillé Abatteur", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('powx_joblisting:setJobAbatteur')

                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

                ESX.ShowAdvancedNotification('Pole Emploi', '~b~Annonce Pole Emploi', 'Vous etes désormais ~b~Abatteur.', 'CHAR_ALL_PLAYERS_CONF', 8)
            end
        end)
        RageUI.Button("------------------------------------------------------------------------", "Choisissez votre metier", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("~g~Travaillé~s~ : Couturier", "Travaillé Couturier", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('powx_joblisting:setJobCouturier')

                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

                ESX.ShowAdvancedNotification('Pole Emploi', '~b~Annonce Pole Emploi', 'Vous etes désormais ~b~Couturier.', 'CHAR_ALL_PLAYERS_CONF', 8)
            end
        end)
        RageUI.Button("------------------------------------------------------------------------", "Choisissez votre metier", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("~g~Redevenir~s~ : Chômeur", "Depart a la retraite", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('powx_joblisting:setJobChômeur')

                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

                ESX.ShowAdvancedNotification('Pole Emploi', '~b~Annonce Pole Emploi', 'Vous avais pris désormais votre Depart a la retraite', 'CHAR_ALL_PLAYERS_CONF', 8)
            end
        end)


        end, function()
        end, 1)
        Citizen.Wait(0)
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

     if Vdist2(GetEntityCoords(PlayerPedId(), false), -267.09, -959.78, 31.22) < 1.0 then
        RageUI.Text({
        message = "Appuyez sur [~b~E~w~] pour acceder au ~b~Pole Emploi",
        time_display = 1
        })
    --    ESX.ShowHelpNotification('Appuyez sur [E] pour acceder au ~b~Pole Emploi')
         if IsControlJustPressed(1,51) then 
            RageUI.Visible(RMenu:Get('poleemploi', 'main'), not RageUI.Visible(RMenu:Get('poleemploi', 'main')))
         end
        end
    end
end)




-------PED---------

function myCreatePed()
    --Obtain the hash of the model we want
    local Hash = GetHashKey( "s_f_y_cop_01" )
    
    --If the model is not loaded, load it
    if not HasModelLoaded( Hash ) then
        RequestModel( Hash )
        --Wait 200ms to load the model into memory
        Wait( 200 )
    end

    --Find the position of our local player
    local Coords = GetEntityCoords( GetPlayerPed( -1 ) )
    ped = CreatePed("PED_TYPE_POLE", "a_m_m_prolhost_01", -267.59, -958.63, 30.22, 207.58, false, true)
    --7th positional argument is a boolean value for networking the ped. Set to true for network interaction.

    --Let's give our ped a weapon
    local WeaponHash = GetHashKey( "WEAPON_NIGHTSTICK" )
    GiveWeaponToPed( Ped, WeaponHash, -1, false, true )
end

--[[Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_prolhost_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(1)
    end
    ped = CreatePed("PED_TYPE_POLE", "a_m_m_prolhost_01", -267.59, -958.63, 30.22, 207.58, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)]]


-- Blip

local blips = {
    {title="Pôle Emploi", colour=2, id=409, x = -265.0, y = -963.6, z = 30.2}
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)



-- By PowX#2629