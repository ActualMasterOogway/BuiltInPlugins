local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
local v2 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerMessage);
return function(_, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (copy)
        game:GetService("Selection"):Set({
            nil
        });
        v5:dispatch(v1(true));
        v5:dispatch(v2(v4));
    end;
end;