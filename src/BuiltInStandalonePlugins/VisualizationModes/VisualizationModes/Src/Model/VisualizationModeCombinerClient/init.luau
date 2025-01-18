local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local _ = require(l_script_FirstAncestor_0.Src.Model.Tracking.VisualizationModeServiceTracker);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v7 = setmetatable({}, v4);
    v7._maid = v2.new();
    v7._visualizationModeServiceTracker = assert(v6, "No tracker");
    v7._plugin = assert(v5, "No plugin");
    v7:_setupStateBinding();
    v7:_bindRemoteRequests();
    return v7;
end;
v4._bindRemoteRequests = function(v8) --[[ Line: 35 ]] --[[ Name: _bindRemoteRequests ]]
    v8._maid:giveTask(v8._plugin:OnInvoke("updateVisualizationModeIsEnabled", function(v9, v10, v11) --[[ Line: 39 ]]
        -- upvalues: v8 (copy)
        assert(typeof(v9) == "string", "Bad visualizationModeCategoryName");
        assert(typeof(v10) == "string", "Bad visualizationModeName");
        assert(typeof(v11) == "boolean", "Bad isEnabled");
        v8._visualizationModeServiceTracker:updateVisualizationModeIsEnabled(v9, v10, v11);
    end));
    v8._maid:giveTask(v8._plugin:OnInvoke("updateVisualizationModeCategoryIsEnabled", function(v12, v13) --[[ Line: 56 ]]
        -- upvalues: v8 (copy)
        assert(typeof(v12) == "string", "Bad visualizationModeCategoryName");
        assert(typeof(v13) == "boolean", "Bad isEnabled");
        v8._visualizationModeServiceTracker:updateVisualizationModeCategoryIsEnabled(v12, v13);
    end));
end;
v4._setupStateBinding = function(v14) --[[ Line: 69 ]] --[[ Name: _setupStateBinding ]]
    v14._maid:giveTask(v14._visualizationModeServiceTracker.changed:Connect(function() --[[ Line: 70 ]]
        -- upvalues: v14 (copy)
        v14:_reportCombinerClientState();
    end));
    v14._maid:giveTask(v14._plugin:OnInvoke("queryClientCombinerState", function() --[[ Line: 74 ]]
        -- upvalues: v14 (copy)
        v14:_reportCombinerClientState();
    end));
    v14._maid:giveTask(v14._plugin:GetPropertyChangedSignal("HostDataModelType"):Connect(function() --[[ Line: 78 ]]
        -- upvalues: v14 (copy)
        v14:_reportCombinerClientState();
    end));
    v14._maid:giveTask(function() --[[ Line: 82 ]]
        -- upvalues: v14 (copy)
        v14:_reportCombinerClientClosingState();
    end);
    v14:_reportCombinerClientState();
end;
v4._reportCombinerClientState = function(v15) --[[ Line: 89 ]] --[[ Name: _reportCombinerClientState ]]
    local v16 = v15._visualizationModeServiceTracker:getState();
    if v16 == nil then
        return;
    else
        local v17 = {
            visualizationModeServiceState = v16, 
            hostDataModelType = v15._plugin.HostDataModelType
        };
        v15._plugin:Invoke("reportClientCombinerState", v17);
        return;
    end;
end;
v4._reportCombinerClientClosingState = function(v18) --[[ Line: 103 ]] --[[ Name: _reportCombinerClientClosingState ]]
    local v19 = {
        visualizationModeServiceState = {}, 
        hostDataModelType = v18._plugin.HostDataModelType
    };
    v18._plugin:Invoke("reportClientCombinerState", v19);
end;
v4.destroy = function(v20) --[[ Line: 112 ]] --[[ Name: destroy ]]
    v20._maid:destroy();
end;
return v4;