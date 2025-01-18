local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.RoactInspector.Classes.RoactInspectorApi);
local v4 = require(l_Parent_0.Services);
local v5 = require(l_Parent_0.EventName);
local v11 = v2:extend("InspectorDebugInterface", function(v6) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy)
    local v7 = v1.new(v4.getStudioService());
    local v8 = v1.new(game:GetService("CoreGui"));
    local v9 = v1.new(game:GetService("ReplicatedStorage"), true);
    local v10 = v2.new("Inspector", "Inspector", {
        v7, 
        v8, 
        v9
    });
    v10.handlers = v6;
    return v10;
end);
v11._init = function(v12) --[[ Line: 22 ]] --[[ Name: _init ]]
    v12:_connectInspector();
end;
v11.getTargetApi = function(v13) --[[ Line: 26 ]] --[[ Name: getTargetApi ]]
    return v13.targetApi;
end;
v11.closeTargetApi = function(v14) --[[ Line: 30 ]] --[[ Name: closeTargetApi ]]
    if v14.targetApi then
        v14.targetApi:close();
    end;
end;
v11._connectInspector = function(v15) --[[ Line: 36 ]] --[[ Name: _connectInspector ]]
    -- upvalues: v5 (copy)
    v15:_connect({
        eventName = v5.ShowTargets, 
        onEvent = function(v16) --[[ Line: 39 ]] --[[ Name: onEvent ]]
            -- upvalues: v15 (copy)
            v15.handlers.onAddTargets(v16);
        end
    });
end;
v11.getTargets = function(v17) --[[ Line: 45 ]] --[[ Name: getTargets ]]
    -- upvalues: v5 (copy)
    v17:_send({
        eventName = v5.GetTargets
    });
end;
v11.attachRoactTree = function(v18, v19, v20) --[[ Line: 51 ]] --[[ Name: attachRoactTree ]]
    -- upvalues: v3 (copy)
    local v21 = v3.new(v18, v19, v20);
    v21:attach(v18.handlers.RoactInspector);
    v18.targetApi = v21;
    return v18.targetApi;
end;
return v11;