local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Http);
local v2 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v3 = require(l_Parent_0.Src.Thunks.InitPolicySettingStatus);
game:DefineFastFlag("PlayerEmulatorPolicyServiceEndpointMigrationEnabled2", false);
local v4 = nil;
local v5 = nil;
if game:GetFastFlag("PlayerEmulatorPolicyServiceEndpointMigrationEnabled2") then
    v4 = v2.BuildUrl("apis", "player-policy-service/v1/player-policy-all-values");
    v5 = v2.BuildUrl("apis", "player-policy-service/v1/player-policy-client");
else
    v4 = v2.BuildUrl("gameinternationalization", "v1/player-policies/all-values");
    v5 = v2.BuildUrl("gameinternationalization", "v1/player-policies-client");
end;
local function v14(v6, v7, v8, v9) --[[ Line: 27 ]] --[[ Name: getPlayerPolicyInfo ]]
    -- upvalues: v5 (ref), v1 (copy), v3 (copy)
    local v10 = v8:handleRetry((v8:get(v5)));
    v8.parseJson(v10):andThen(function(v11) --[[ Line: 30 ]]
        -- upvalues: v1 (ref), v7 (copy), v3 (ref), v6 (copy), v9 (copy)
        if v11.responseCode == v1.StatusCodes.OK then
            local l_responseBody_0 = v11.responseBody;
            v7:dispatch(v3(v6, l_responseBody_0, v9));
            return;
        else
            v7:dispatch(v3(v6, {}, v9));
            warn("Player Emulator can't get player policy info: HTTP error " .. tostring(v11.responseCode));
            return;
        end;
    end, function(v13) --[[ Line: 38 ]]
        -- upvalues: v7 (copy), v3 (ref), v6 (copy), v9 (copy)
        v7:dispatch(v3(v6, {}, v9));
        warn("Player Emulator can't get player policy info: " .. v13);
    end);
end;
return function(v15, v16) --[[ Line: 44 ]]
    -- upvalues: v4 (ref), v1 (copy), v14 (copy)
    return function(v17) --[[ Line: 45 ]]
        -- upvalues: v15 (copy), v4 (ref), v1 (ref), v14 (ref), v16 (copy)
        local v18 = v15:get(v4);
        local v19 = v15:handleRetry(v18);
        v15.parseJson(v19):andThen(function(v20) --[[ Line: 48 ]]
            -- upvalues: v1 (ref), v14 (ref), v17 (copy), v15 (ref), v16 (ref)
            if v20.responseCode == v1.StatusCodes.OK then
                local l_responseBody_1 = v20.responseBody;
                v14(l_responseBody_1, v17, v15, v16);
                return;
            else
                warn("Player Emulator failed to load policy section data");
                return;
            end;
        end, function(v22) --[[ Line: 55 ]]
            warn("Player Emulator can't get policies info: " .. v22);
        end);
    end;
end;