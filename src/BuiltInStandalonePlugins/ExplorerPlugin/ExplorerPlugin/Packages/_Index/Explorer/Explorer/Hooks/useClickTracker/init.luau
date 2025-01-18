local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.WindowInputContext);
local v5 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local v6 = {
    eventName = "LuaExplorerClicked", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    throttlingPercentage = game:DefineFastInt("LuaExplorerClickedThrottlingHundredthsPercent", 10000), 
    description = "Fires when Explorer is clicked.", 
    lastUpdated = "2024-11-22"
};
return function() --[[ Line: 17 ]] --[[ Name: useClickTracker ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v7 = v3.useContext(v1.AnalyticsContext);
    local v8 = v3.useContext(v4.Context);
    local v9 = {
        current = nil
    };
    local v10 = {
        current = false
    };
    v2.useEffect(v8.windowHoveredObservable, function(v11) --[[ Line: 24 ]]
        -- upvalues: v10 (copy), v9 (copy)
        if v11 == v10.current then
            return;
        else
            v10.current = v11;
            if v11 and v9.current == nil then
                v9.current = os.clock();
                return;
            else
                if not v11 then
                    v9.current = nil;
                end;
                return;
            end;
        end;
    end, {});
    v5(v8.inputBeganSignal, function(v12) --[[ Line: 41 ]]
        -- upvalues: v7 (copy), v6 (ref), v9 (copy)
        if v12.UserInputType ~= Enum.UserInputType.MouseButton1 and v12.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return;
        else
            v7.logCounter(v6);
            local l_current_0 = v9.current;
            if l_current_0 == nil then
                return;
            else
                local v14 = os.clock() - l_current_0;
                v9.current = nil;
                v7.logStat({
                    eventName = "LuaExplorerTimeToFirstClickAfterHovering", 
                    backends = {
                        "RobloxTelemetryStat"
                    }, 
                    throttlingPercentage = game:DefineFastInt("LuaExplorerTimeToFirstClickAfterHoveirngThrottlingHundredthsPercent", 10000), 
                    description = "Time since hovering over the window before the user takes their first click or right-click.", 
                    lastUpdated = "2024-12-03"
                }, {}, v14);
                return;
            end;
        end;
    end, {
        v7.logCounter
    });
end;