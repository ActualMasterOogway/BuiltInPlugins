local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
return function(v2) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    local v3 = v1[v2];
    local v4 = nil;
    if v3 and v3.style then
        v4 = require(v3.style);
    end;
    return v4;
end;