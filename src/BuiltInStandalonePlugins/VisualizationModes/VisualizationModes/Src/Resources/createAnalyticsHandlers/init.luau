local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local l_StudioService_0 = game:GetService("StudioService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioSendVisualizationModeCounter);
local v6 = {
    eventName = "SBT_VisModeEnabled", 
    lastUpdated = {
        2024, 
        11, 
        13
    }, 
    description = "Visualization mode enabled from the plugin.", 
    links = "https://grafana.rbx.com/d/ae0dljzicfs3kb?from=now-10d", 
    backends = {
        "RobloxTelemetryCounter"
    }
};
return function(v7) --[[ Line: 40 ]]
    -- upvalues: v3 (copy), l_StudioService_0 (copy), v5 (copy), l_TelemetryService_0 (copy), v6 (copy)
    local function v11(v8, v9) --[[ Line: 41 ]] --[[ Name: sendEvent ]]
        -- upvalues: v3 (ref), v7 (copy), l_StudioService_0 (ref)
        local v10 = v3.join({
            studioSid = v7:GetSessionId(), 
            clientId = v7:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v9);
        v7:SendEventDeferred("studio", "VisualizationModes", v8, v10);
    end;
    return {
        openPlugin = function() --[[ Line: 53 ]] --[[ Name: openPlugin ]]
            -- upvalues: v11 (copy)
            v11("PluginOpen");
        end, 
        visualizationModeToggled = function(_, v13) --[[ Line: 57 ]] --[[ Name: visualizationModeToggled ]]
            -- upvalues: v11 (copy), v5 (ref), l_TelemetryService_0 (ref), v6 (ref)
            v11("VisualizationModeToggled", {
                actionSource = v13.actionSource, 
                visualizationMode = v13.visualizationMode, 
                visualizationModeCategory = v13.visualizationModeCategory, 
                visualizationModeEnabled = v13.isEnabled
            });
            if v5() then
                l_TelemetryService_0:LogCounter(v6, {
                    customFields = {
                        mode = v13.visualizationMode, 
                        category = v13.visualizationModeCategory
                    }
                });
            end;
        end, 
        visualizationModeEnabledDuration = function(_, v15) --[[ Line: 75 ]] --[[ Name: visualizationModeEnabledDuration ]]
            -- upvalues: v11 (copy)
            v11("VisualizationModeEnabledDuration", {
                visualizationMode = v15.visualizationMode, 
                visualizationModeCategory = v15.visualizationModeCategory, 
                durationSeconds = v15.durationSeconds
            });
        end
    };
end;