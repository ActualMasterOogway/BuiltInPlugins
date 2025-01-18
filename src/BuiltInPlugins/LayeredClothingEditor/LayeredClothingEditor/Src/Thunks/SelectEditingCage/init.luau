local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetEditingCage);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 5 ]]
        -- upvalues: v2 (copy), v1 (ref)
        if v3:getState().selectItem.editingCage ~= v2 then
            v3:dispatch(v1(v2));
        end;
    end;
end;