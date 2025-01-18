local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.ResumePreviewSound);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v2) --[[ Line: 6 ]]
        -- upvalues: v1 (ref)
        v2:dispatch(v1());
    end;
end;