local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.DEPRECATED_modules.Http.Promise);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({}, v2));
end;
v2.resolveAssets = function(_, v4, v5) --[[ Line: 21 ]] --[[ Name: resolveAssets ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        responseBody = {
            TotalResults = v5 or #v4, 
            Results = v4
        }
    });
end;
v2.getMyGroups = function(_, _) --[[ Line: 30 ]] --[[ Name: getMyGroups ]]
    -- upvalues: v1 (copy)
    return v1.resolve({});
end;
return v2;