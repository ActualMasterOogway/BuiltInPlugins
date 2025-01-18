local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.CheckedValueContext);
return function() --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    return v3.value, v3.onValueChanged;
end;