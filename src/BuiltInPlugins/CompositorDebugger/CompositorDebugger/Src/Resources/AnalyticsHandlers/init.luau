local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: l_join_0 (copy), l_StudioService_0 (copy)
    local function v7(v5, v6) --[[ Line: 12 ]] --[[ Name: sendEvent ]]
        -- upvalues: l_join_0 (ref), v4 (copy), l_StudioService_0 (ref)
        v6 = l_join_0(v6 or {}, {
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        });
        v4:SendEventDeferred("studio", "compositorDebugger", v5, v6);
    end;
    return {
        onChangeSetting = function(v8, v9, v10) --[[ Line: 23 ]] --[[ Name: onChangeSetting ]]
            -- upvalues: v7 (copy)
            v7(v8, {
                [v9] = v10
            });
        end, 
        onCompositorConnected = function(v11, v12, v13) --[[ Line: 29 ]] --[[ Name: onCompositorConnected ]]
            -- upvalues: v7 (copy)
            v7(v11, {
                depth = v12, 
                layers = v13
            });
        end, 
        onLayerTabChanged = function(v14, v15, v16, v17, v18) --[[ Line: 36 ]] --[[ Name: onLayerTabChanged ]]
            -- upvalues: v7 (copy)
            v7(v14, {
                oldTab = v15, 
                newTab = v16, 
                reason = v17, 
                duration = math.floor(v18 * 1000)
            });
        end, 
        onPluginClosed = function(v19, v20) --[[ Line: 45 ]] --[[ Name: onPluginClosed ]]
            -- upvalues: v7 (copy)
            v7(v19, {
                timeSinceOpened = math.floor(v20 * 1000)
            });
        end, 
        onScrubbing = v7
    };
end;