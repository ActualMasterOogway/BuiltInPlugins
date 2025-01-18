local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices.ContextItem);
local v2 = require(l_Parent_0.RobloxAPI);
local v3 = v1:extend("API");
v3.new = function(v4) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v4 then
        assert(type(v4) == "table", "Expected a table of props to pass to a RobloxAPI instance");
    end;
    local v5 = {
        api = v2.new(v4)
    };
    setmetatable(v5, v3);
    return v5;
end;
v3.get = function(v6) --[[ Line: 27 ]] --[[ Name: get ]]
    return v6.api;
end;
return v3;