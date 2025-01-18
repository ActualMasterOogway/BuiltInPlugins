local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = l_ContextItem_0:extend("Signals");
v4.new = function(v5) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v6 = {};
    setmetatable(v6, v4);
    v6.signals = v6:__mapSignalIDs(v5);
    return v6;
end;
v4.__mapSignalIDs = function(_, v8) --[[ Line: 29 ]] --[[ Name: __mapSignalIDs ]]
    -- upvalues: l_Signal_0 (copy)
    local v9 = {};
    for _, v11 in pairs(v8) do
        assert(v9[v11] == nil, "Duplicate action, ID: " .. v11);
        v9[v11] = l_Signal_0.new();
    end;
    return v9;
end;
v4.get = function(v12, v13) --[[ Line: 41 ]] --[[ Name: get ]]
    return v12.signals[v13];
end;
return v4;