local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local function v6(v1, v2) --[[ Line: 8 ]] --[[ Name: parseErrorMessages ]]
    local v3 = v2 .. " HTTP " .. v1.responseCode;
    warn(v3);
    for _, v5 in pairs(v1.responseBody.errors) do
        warn(v5.userFacingMessage);
    end;
end;
return function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: saveCopyOfExperience ]]
    -- upvalues: l_StudioPublishService_0 (copy), v6 (copy)
    local l_GameId_0 = game.GameId;
    local v11 = v9.teamCreateEnabled and true or false;
    l_StudioPublishService_0:SetTeamCreateOnPublishInfo(v11, v9.name);
    l_StudioPublishService_0:setUploadNames(v9.name, v9.name);
    l_StudioPublishService_0:publishAs(0, 0, 0, false, nil, false, false);
    local v12 = nil;
    local v13 = nil;
    local v14, v15 = l_StudioPublishService_0.GamePublishFinished:wait();
    v12 = v14;
    v13 = v15;
    while l_GameId_0 ~= game.GameId do
        wait();
    end;
    if not v12 then
        return;
    else
        v8.Develop.V2.Universes.configuration(v13, v9):makeRequest():andThen(function() --[[ Line: 35 ]]
            -- upvalues: l_StudioPublishService_0 (ref), v9 (copy)
            l_StudioPublishService_0:SetUniverseDisplayName(v9.name);
            l_StudioPublishService_0:RefreshDocumentDisplayName();
            l_StudioPublishService_0:EmitPlacePublishedSignal();
        end, function(v16) --[[ Line: 39 ]]
            -- upvalues: v6 (ref), v7 (copy)
            v6(v16, v7:getText("Error", "SetConfiguration"));
        end);
        v8.Develop.V1.Universes.deactivate(v13):makeRequest():catch(function(v17) --[[ Line: 43 ]]
            -- upvalues: v6 (ref), v7 (copy)
            v6(v17, v7:getText("Error", "DeactivatingUniverse"));
        end);
        return v13;
    end;
end;