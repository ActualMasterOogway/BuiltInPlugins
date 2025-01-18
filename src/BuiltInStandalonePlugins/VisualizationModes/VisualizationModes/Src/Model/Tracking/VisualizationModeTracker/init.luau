local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Signal);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = false;
    if typeof(v5) == "Instance" then
        v6 = v5:IsA("VisualizationMode");
    end;
    assert(v6, "Bad visualizationMode");
    local v7 = setmetatable({}, v4);
    v7._maid = v2.new();
    v7._visualizationMode = v5;
    v7._state = nil;
    v7.changed = v7._maid:add(v3.new());
    v7:_startTracking();
    return v7;
end;
v4.getState = function(v8) --[[ Line: 41 ]] --[[ Name: getState ]]
    return v8._state;
end;
v4._setState = function(v9, v10) --[[ Line: 45 ]] --[[ Name: _setState ]]
    if v9._state == v10 then
        return;
    else
        v9._state = v10;
        v9.changed:Fire(v10);
        return;
    end;
end;
v4._startTracking = function(v11) --[[ Line: 54 ]] --[[ Name: _startTracking ]]
    v11._maid:giveTask(v11._visualizationMode:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 55 ]]
        -- upvalues: v11 (copy)
        v11:_updateState();
    end));
    v11._maid:giveTask(v11._visualizationMode:GetPropertyChangedSignal("Title"):Connect(function() --[[ Line: 58 ]]
        -- upvalues: v11 (copy)
        v11:_updateState();
    end));
    v11._maid:giveTask(v11._visualizationMode:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 61 ]]
        -- upvalues: v11 (copy)
        v11:_updateState();
    end));
    v11._maid:giveTask(v11._visualizationMode:GetPropertyChangedSignal("ToolTip"):Connect(function() --[[ Line: 64 ]]
        -- upvalues: v11 (copy)
        v11:_updateState();
    end));
    v11:_updateState();
end;
v4.updateVisualizationModeIsEnabled = function(v12, v13) --[[ Line: 71 ]] --[[ Name: updateVisualizationModeIsEnabled ]]
    v12._visualizationMode.Enabled = v13;
end;
v4._updateState = function(v14) --[[ Line: 75 ]] --[[ Name: _updateState ]]
    v14:_setState(table.freeze({
        name = v14._visualizationMode.Name, 
        title = v14._visualizationMode.Title, 
        enabled = v14._visualizationMode.Enabled, 
        toolTip = v14._visualizationMode.ToolTip
    }));
end;
v4.destroy = function(v15) --[[ Line: 84 ]] --[[ Name: destroy ]]
    v15._maid:destroy();
end;
return v4;