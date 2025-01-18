local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Util.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (setmetatable({
        _selection = {}, 
        SelectionChanged = v1.new()
    }, v2));
end;
v2.Destroy = function(_) --[[ Line: 16 ]] --[[ Name: Destroy ]]

end;
v2.Get = function(v4) --[[ Line: 18 ]] --[[ Name: Get ]]
    return v4._selection;
end;
v2.Set = function(v5, v6) --[[ Line: 22 ]] --[[ Name: Set ]]
    v5._selection = v6;
    v5.SelectionChanged:Fire();
end;
return v2;