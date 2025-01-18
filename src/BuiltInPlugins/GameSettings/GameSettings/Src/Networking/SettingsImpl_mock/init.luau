local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({}, v2));
end;
v2.GetUserId = function(_) --[[ Line: 19 ]] --[[ Name: GetUserId ]]
    return 0;
end;
v2.GetSettings = function(_) --[[ Line: 23 ]] --[[ Name: GetSettings ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v2.SaveAll = function(_) --[[ Line: 27 ]] --[[ Name: SaveAll ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve();
end;
return v2;