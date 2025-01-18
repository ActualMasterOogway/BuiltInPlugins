local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Utility.RelativeTo);
return function() --[[ Line: 15 ]]
    -- upvalues: v2 (copy), l_Selection_0 (copy)
    return function(v3) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), l_Selection_0 (ref)
        local v4 = v3:getState();
        local _ = nil;
        l_Selection_0.ShowActiveInstanceHighlight = if v4.toolEnabled then v4.relativeTo == v2.Active else false;
    end;
end;