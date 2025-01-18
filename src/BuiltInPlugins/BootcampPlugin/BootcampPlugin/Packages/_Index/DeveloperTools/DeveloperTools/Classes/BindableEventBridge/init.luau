local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Dash);
local l_join_0 = v2.join;
local l_class_0 = v2.class;
local l_forEach_0 = v2.forEach;
local l_insert_0 = table.insert;
local v9 = l_class_0("BindableEventBridge", function(_, v8) --[[ Line: 23 ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        id = l_HttpService_0:GenerateGUID(), 
        connections = {}, 
        noCreate = v8
    };
end);
v9._createEvent = function(v10, v11) --[[ Line: 32 ]] --[[ Name: _createEvent ]]
    if v10.noCreate then
        return nil;
    else
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = "DeveloperTools";
        l_BindableEvent_0.Parent = v11;
        return l_BindableEvent_0;
    end;
end;
v9._init = function(v13, v14) --[[ Line: 42 ]] --[[ Name: _init ]]
    v13.event = v14:FindFirstChild("DeveloperTools") or v13:_createEvent(v14);
end;
v9.send = function(v15, v16) --[[ Line: 46 ]] --[[ Name: send ]]
    -- upvalues: l_join_0 (copy)
    local v17 = l_join_0(v16, {
        fromBridgeId = v15.id
    });
    if v15.event then
        v15.event:Fire(v17);
    end;
end;
v9.connect = function(v18, v19) --[[ Line: 55 ]] --[[ Name: connect ]]
    -- upvalues: l_insert_0 (copy)
    local function v21(v20) --[[ Line: 56 ]] --[[ Name: onEvent ]]
        -- upvalues: v18 (copy), v19 (copy)
        if v20.fromBridgeId ~= v18.id then
            v19(v20);
        end;
    end;
    if v18.event then
        local v22 = v18.event.Event:Connect(v21);
        l_insert_0(v18.connections, v22);
        return v22;
    else
        return nil;
    end;
end;
v9.destroy = function(v23) --[[ Line: 70 ]] --[[ Name: destroy ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v23.connections, function(v24) --[[ Line: 71 ]]
        v24:Disconnect();
    end);
end;
return v9;