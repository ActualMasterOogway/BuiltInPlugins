local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombiner);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Src.Model.Telemetry.VisualizationModeDurationTelemetry);
return function() --[[ Line: 21 ]] --[[ Name: useVisualizationModeCombiner ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v6 = v4.ContextServices.Plugin:use():get();
    local v7 = v4.ContextServices.Analytics:use();
    local v8 = v2.useState(function() --[[ Line: 25 ]]
        -- upvalues: v3 (ref), v6 (copy)
        return v3.new(v6);
    end);
    local v9 = v2.useState(function() --[[ Line: 29 ]]
        -- upvalues: v5 (ref), v8 (copy), v7 (copy)
        return v5.new(v8, v7);
    end);
    local v10, v11 = v2.useState(function() --[[ Line: 33 ]]
        -- upvalues: v8 (copy)
        return v8:getState() or {
            categories = {}, 
            recentModes = {}
        };
    end);
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v9 (copy), v8 (copy)
        return function() --[[ Line: 41 ]]
            -- upvalues: v9 (ref), v8 (ref)
            v9:destroy();
            v8:destroy();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v8 (copy), v11 (copy)
        local v13 = v8.changed:Connect(function(v12) --[[ Line: 48 ]]
            -- upvalues: v11 (ref)
            v11(v12);
        end);
        local v14 = v8:getState();
        if v14 then
            v11(v14);
        end;
        return function() --[[ Line: 57 ]]
            -- upvalues: v13 (copy)
            v13:Disconnect();
        end;
    end, {});
    local v19 = v2.useCallback(function(v15, v16, v17, v18) --[[ Line: 63 ]]
        -- upvalues: v8 (copy)
        v8:updateVisualizationModeIsEnabled(v15, v16, v17);
        if v18 then
            v8:recordRecentVisualizationMode(v15, v16);
        end;
    end, {});
    local v22 = v2.useCallback(function(v20, v21) --[[ Line: 79 ]]
        -- upvalues: v8 (copy)
        v8:updateVisualizationModeCategoryIsEnabled(v20, v21);
    end, {});
    return table.freeze({
        onVisualizationModeToggle = v19, 
        onVisualizationModeCategoryToggle = v22, 
        state = v10, 
        combiner = v8
    });
end;