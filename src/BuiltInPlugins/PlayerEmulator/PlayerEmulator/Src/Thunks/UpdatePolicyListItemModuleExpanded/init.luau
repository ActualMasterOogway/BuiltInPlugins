local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.UpdatePolicySettingListItemsModuleExpanded);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (copy)
        v3:dispatch(v1(v2));
    end;
end;