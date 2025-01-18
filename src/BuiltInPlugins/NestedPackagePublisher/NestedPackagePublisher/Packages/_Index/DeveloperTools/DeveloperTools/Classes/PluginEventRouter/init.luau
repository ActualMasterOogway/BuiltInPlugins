local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Dash);
local l_join_0 = v2.join;
local l_class_0 = v2.class;
local l_forEach_0 = v2.forEach;
local v9 = l_class_0("PluginEventRouter", function(v6, v7, v8) --[[ Line: 18 ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        routerId = l_HttpService_0:GenerateGUID(), 
        sourceName = v6, 
        plugin = v7, 
        bridges = v8, 
        outboundBridgeIds = {}
    };
end);
v9._init = function(v10) --[[ Line: 29 ]] --[[ Name: _init ]]
    -- upvalues: l_join_0 (copy), l_forEach_0 (copy)
    v10.connection = v10.plugin:OnInvoke("DeveloperTools", function(v11) --[[ Line: 30 ]]
        -- upvalues: v10 (copy), l_join_0 (ref), l_forEach_0 (ref)
        if v11.fromRouter then
            return;
        else
            v10.outboundBridgeIds[v11.fromBridgeId] = true;
            local v12 = l_join_0(v11, {
                sourceName = v10.sourceName
            });
            l_forEach_0(v10.bridges, function(v13) --[[ Line: 40 ]]
                -- upvalues: v12 (copy)
                v13:send(v12);
            end);
            return;
        end;
    end);
    local function v16(v14) --[[ Line: 44 ]] --[[ Name: onEvent ]]
        -- upvalues: l_join_0 (ref), v10 (copy)
        local v15 = l_join_0(v14, {
            fromRouter = true
        });
        v10.plugin:Invoke("DeveloperTools", v15);
    end;
    l_forEach_0(v10.bridges, function(v17) --[[ Line: 53 ]]
        -- upvalues: v16 (copy)
        v17:connect(v16);
    end);
end;
v9.destroy = function(v18) --[[ Line: 58 ]] --[[ Name: destroy ]]
    v18.connection:Disconnect();
end;
return v9;