local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
return function(_) --[[ Line: 3 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 4 ]]
        -- upvalues: v1 (ref)
        v3:dispatch(v1(false));
    end;
end;