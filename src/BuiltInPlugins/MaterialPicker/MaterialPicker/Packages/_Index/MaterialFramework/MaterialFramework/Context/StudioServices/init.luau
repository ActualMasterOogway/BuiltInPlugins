local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_ServiceWrapper_0 = v1.TestHelpers.ServiceWrapper;
local v4 = l_ContextItem_0:extend("StudioServices");
v4.new = function(v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_ServiceWrapper_0 (copy)
    local v6 = setmetatable({
        _serviceWrappers = {}
    }, v4);
    v6.createServiceIfNeeded = function(v7) --[[ Line: 15 ]]
        -- upvalues: v6 (copy), l_ServiceWrapper_0 (ref), v5 (copy)
        if not v6._serviceWrappers[v7] then
            local v8 = l_ServiceWrapper_0.new(v7, v5);
            v6._serviceWrappers[v7] = v8;
        end;
        return v6._serviceWrappers[v7];
    end;
    return v6;
end;
v4.mock = function() --[[ Line: 26 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    return v4.new(true);
end;
v4.destroy = function(v9) --[[ Line: 30 ]] --[[ Name: destroy ]]
    for _, v11 in v9._serviceWrappers do
        v11:destroy();
    end;
    v9._serviceWrappers = {};
end;
v4.getService = function(v12, v13) --[[ Line: 37 ]] --[[ Name: getService ]]
    return v12.createServiceIfNeeded(v13):asService();
end;
v4.getServiceInstance = function(v14, v15) --[[ Line: 42 ]] --[[ Name: getServiceInstance ]]
    return v14.createServiceIfNeeded(v15):asInstance();
end;
return v4;