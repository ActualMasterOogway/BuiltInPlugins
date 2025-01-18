local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Signal);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(script.Parent.VisualizationModeTracker);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v1 (copy), v2 (copy)
    local v7 = false;
    if typeof(v6) == "Instance" then
        v7 = v6:IsA("VisualizationModeCategory");
    end;
    assert(v7, "Bad visualizationModeCategory");
    local v8 = setmetatable({}, v5);
    v8._maid = v1.new();
    v8._visualizationModeCategory = v6;
    v8._visualizationModeTrackers = {};
    v8._state = nil;
    v8.changed = v2.new();
    v8:_startTracking();
    return v8;
end;
v5.getState = function(v9) --[[ Line: 50 ]] --[[ Name: getState ]]
    return v9._state;
end;
v5._setState = function(v10, v11) --[[ Line: 54 ]] --[[ Name: _setState ]]
    if v10._state == v11 then
        return;
    else
        v10._state = v11;
        v10.changed:Fire(v11);
        return;
    end;
end;
v5._startTracking = function(v12) --[[ Line: 63 ]] --[[ Name: _startTracking ]]
    v12._maid:giveTask(v12._visualizationModeCategory.ChildAdded:Connect(function(v13) --[[ Line: 64 ]]
        -- upvalues: v12 (copy)
        v12:_handleChildAdded(v13);
    end));
    v12._maid:giveTask(v12._visualizationModeCategory.ChildRemoved:Connect(function(v14) --[[ Line: 68 ]]
        -- upvalues: v12 (copy)
        v12._maid[v14] = nil;
    end));
    v12._maid:giveTask(v12._visualizationModeCategory:GetPropertyChangedSignal("Title"):Connect(function() --[[ Line: 72 ]]
        -- upvalues: v12 (copy)
        v12:_queueUpdateState();
    end));
    v12._maid:giveTask(v12._visualizationModeCategory:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 76 ]]
        -- upvalues: v12 (copy)
        v12:_queueUpdateState();
    end));
    for _, v16 in v12._visualizationModeCategory:GetChildren() do
        v12:_handleChildAdded(v16);
    end;
    v12:_queueUpdateState();
end;
v5._queueUpdateState = function(v17) --[[ Line: 87 ]] --[[ Name: _queueUpdateState ]]
    if v17._maid._stateUpdateQueue then
        return;
    else
        v17._maid._stateUpdateQueue = task.defer(function() --[[ Line: 92 ]]
            -- upvalues: v17 (copy)
            v17._maid._stateUpdateQueue = nil;
            v17:_updateState();
        end);
        return;
    end;
end;
v5._updateState = function(v18) --[[ Line: 98 ]] --[[ Name: _updateState ]]
    local v19 = {};
    for _, v21 in v18._visualizationModeTrackers do
        local v22 = v21:getState();
        if v22 then
            table.insert(v19, v22);
        end;
    end;
    local v23 = {};
    for _, v25 in v19 do
        v23[v25] = string.lower(v25.title);
    end;
    table.sort(v19, function(v26, v27) --[[ Line: 113 ]]
        -- upvalues: v23 (copy)
        return v23[v26] < v23[v27];
    end);
    v18:_setState(table.freeze({
        visualizationModeList = v19, 
        name = v18._visualizationModeCategory.Name, 
        title = v18._visualizationModeCategory.Title, 
        enabled = v18._visualizationModeCategory.Enabled, 
        lastUpdateTimeUnixTimeStamp = DateTime.now().UnixTimestamp
    }));
end;
v5.updateVisualizationModeIsEnabled = function(v28, v29, v30) --[[ Line: 126 ]] --[[ Name: updateVisualizationModeIsEnabled ]]
    for _, v32 in v28._visualizationModeTrackers do
        local v33 = v32:getState();
        if v33 ~= nil and v33.name == v29 then
            v32:updateVisualizationModeIsEnabled(v30);
        end;
    end;
end;
v5.setIsCategoryEnabled = function(v34, v35) --[[ Line: 141 ]] --[[ Name: setIsCategoryEnabled ]]
    v34._visualizationModeCategory.Enabled = v35;
end;
v5._handleChildAdded = function(v36, v37) --[[ Line: 145 ]] --[[ Name: _handleChildAdded ]]
    -- upvalues: v1 (copy), v4 (copy)
    if not v37:IsA("VisualizationMode") then
        return;
    else
        local v38 = v1.new();
        local v39 = v38:add(v4.new(v37));
        table.insert(v36._visualizationModeTrackers, v39);
        v38:giveTask(v39.changed:Connect(function() --[[ Line: 155 ]]
            -- upvalues: v36 (copy)
            v36:_queueUpdateState();
        end));
        v38:giveTask(function() --[[ Line: 159 ]]
            -- upvalues: v36 (copy), v39 (copy)
            local v40 = table.find(v36._visualizationModeTrackers, v39);
            if v40 then
                table.remove(v36._visualizationModeTrackers, v40);
                v36:_queueUpdateState();
            end;
        end);
        v36._maid[v37] = v38;
        v36:_queueUpdateState();
        return;
    end;
end;
v5.destroy = function(v41) --[[ Line: 172 ]] --[[ Name: destroy ]]
    v41._maid:destroy();
end;
return v5;