local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.sanitizeIconSearchInput);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or "";
    if v3.type == "ToggleIconPicker" then
        return "";
    elseif v3.type == "SetIconSearch" then
        assert(typeof(v3.text) == "string");
        return v1(v3.text);
    else
        return v2;
    end;
end;