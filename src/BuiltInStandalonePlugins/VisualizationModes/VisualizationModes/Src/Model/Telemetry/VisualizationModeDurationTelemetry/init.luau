local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombiner);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v7 = setmetatable({}, v4);
    v7._maid = v1.new();
    v7._visualizationModeCombiner = v5;
    v7._startTimeLookup = {};
    v7._previousState = nil;
    v7._analytics = v6;
    v7._maid:giveTask(v7._visualizationModeCombiner.changed:Connect(function(v8) --[[ Line: 38 ]]
        -- upvalues: v7 (copy)
        v7:_updateEnabledModeDurations(v8);
    end));
    v7:_updateEnabledModeDurations(v7._visualizationModeCombiner:getState());
    v7._maid:giveTask(function() --[[ Line: 44 ]]
        -- upvalues: v7 (copy)
        v7:_updateEnabledModeDurations(nil);
    end);
    return v7;
end;
v4._reportDuration = function(v9, v10, v11, v12) --[[ Line: 52 ]] --[[ Name: _reportDuration ]]
    v9._analytics:report("visualizationModeEnabledDuration", {
        visualizationModeCategory = v10, 
        visualizationMode = v11, 
        durationSeconds = v12
    });
end;
v4._updateEnabledModeDurations = function(v13, v14) --[[ Line: 67 ]] --[[ Name: _updateEnabledModeDurations ]]
    local v15 = os.clock();
    local v16 = {};
    if v14 ~= nil then
        for _, v18 in v14.categories do
            if v16[v18.name] == nil then
                v16[v18.name] = {};
            end;
            for _, v20 in pairs(v18.visualizationModeList) do
                if v20.enabled then
                    v16[v18.name][v20.name] = true;
                end;
            end;
        end;
    end;
    for v21, v22 in v13._startTimeLookup do
        for v23, v24 in v22 do
            if v16[v21] == nil or v16[v21][v23] == nil then
                v13:_reportDuration(v21, v23, v15 - v24);
            end;
        end;
    end;
    local v25 = {};
    for v26, v27 in v16 do
        local v28 = v13._startTimeLookup[v26] or {};
        local v29 = {};
        for v30, _ in v27 do
            v29[v30] = v28[v30] or v15;
        end;
        v25[v26] = table.freeze(v29);
    end;
    v13._startTimeLookup = table.freeze(v25);
end;
v4.destroy = function(v32) --[[ Line: 118 ]] --[[ Name: destroy ]]
    v32._maid:destroy();
end;
return v4;