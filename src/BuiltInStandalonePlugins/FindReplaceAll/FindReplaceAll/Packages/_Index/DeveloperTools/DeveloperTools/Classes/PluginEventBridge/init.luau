local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Dash);
local l_class_0 = v2.class;
local l_join_0 = v2.join;
local l_forEach_0 = v2.forEach;
local l_insert_0 = table.insert;
local v8 = l_class_0("PluginEventBridge", function(v7) --[[ Line: 18 ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        id = l_HttpService_0:GenerateGUID(), 
        plugin = v7, 
        connections = {}
    };
end);
v8.send = function(v9, v10) --[[ Line: 26 ]] --[[ Name: send ]]
    -- upvalues: l_join_0 (copy)
    local v11 = l_join_0(v10, {
        fromBridgeId = v9.id
    });
    v9.plugin:Invoke("DeveloperTools", v11);
end;
v8.connect = function(v12, v13) --[[ Line: 34 ]] --[[ Name: connect ]]
    -- upvalues: l_insert_0 (copy)
    local v15 = v12.plugin:OnInvoke("DeveloperTools", function(v14) --[[ Line: 35 ]] --[[ Name: onEvent ]]
        -- upvalues: v12 (copy), v13 (copy)
        if v14.fromBridgeId ~= v12.id then
            v13(v14);
        end;
    end);
    l_insert_0(v12.connections, v15);
end;
v8.destroy = function(v16) --[[ Line: 44 ]] --[[ Name: destroy ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v16.connections, function(v17) --[[ Line: 45 ]]
        v17:Disconnect();
    end);
end;
return v8;