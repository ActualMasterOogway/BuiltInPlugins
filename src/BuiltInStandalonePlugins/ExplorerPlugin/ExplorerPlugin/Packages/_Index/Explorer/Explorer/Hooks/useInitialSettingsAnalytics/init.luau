local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Components.Contexts.SettingsContext);
return function() --[[ Line: 7 ]] --[[ Name: useInitialSettingsAnalytics ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local v4 = v2.useContext(v1.AnalyticsContext);
    local v5 = v2.useContext(v3.Context);
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v5 (copy)
        local v6 = task.spawn(function() --[[ Line: 12 ]]
            -- upvalues: v4 (ref), v5 (ref)
            v4.logEvent({
                eventName = "LuaExplorerInitialSettings", 
                backends = {
                    "EventIngest"
                }, 
                throttlingPercentage = game:DefineFastInt("LuaExplorerInitialSettingsTelemetryThrottlingHundredthsPercent", 10000), 
                description = "The settings at the time of launch", 
                lastUpdated = "2024-12-03"
            }, {
                selectOnInsertion = v5.getSelectOnInsertionAsync(), 
                incrementNames = v5.getIncrementNamesAsync(), 
                expandHierarchy = v5.getExpandHierarchy(), 
                showSelectionHierarchyHighlights = v5.getShowSelectionHierarchyHighlights()
            });
        end);
        return function() --[[ Line: 30 ]]
            -- upvalues: v6 (copy)
            task.cancel(v6);
        end;
    end, {
        v4, 
        v5
    });
end;