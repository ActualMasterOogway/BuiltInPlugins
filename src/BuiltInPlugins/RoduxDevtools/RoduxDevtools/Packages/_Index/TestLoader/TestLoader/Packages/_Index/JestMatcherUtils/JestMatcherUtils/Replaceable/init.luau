local l_Parent_0 = script.Parent.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: l_getType_0 (copy), v2 (copy)
    local v4 = {
        object = v3, 
        type = l_getType_0(v3)
    };
    if v4.type ~= "table" then
        error("Type " .. v4.type .. " is not supported in Replaceable!");
    end;
    setmetatable(v4, v2);
    return v4;
end;
v2.isReplaceable = function(v5, v6) --[[ Line: 32 ]] --[[ Name: isReplaceable ]]
    -- upvalues: l_getType_0 (copy)
    local v7 = l_getType_0(v5);
    local v8 = l_getType_0(v6);
    local v9 = false;
    if v7 == v8 then
        v9 = v7 == "table";
    end;
    return v9;
end;
v2.forEach = function(v10, v11) --[[ Line: 39 ]] --[[ Name: forEach ]]
    for v12, v13 in pairs(v10.object) do
        v11(v13, v12, v10.object);
    end;
end;
v2.get = function(v14, v15) --[[ Line: 45 ]] --[[ Name: get ]]
    return v14.object[v15];
end;
v2.set = function(v16, v17, v18) --[[ Line: 49 ]] --[[ Name: set ]]
    v16.object[v17] = v18;
end;
return v2;