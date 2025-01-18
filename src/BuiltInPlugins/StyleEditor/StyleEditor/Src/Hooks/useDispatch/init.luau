local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Hooks.useStore);
return function() --[[ Line: 13 ]] --[[ Name: useDispatch ]]
    -- upvalues: v2 (copy)
    local v3 = v2();
    return function(v4) --[[ Line: 16 ]]
        -- upvalues: v3 (copy)
        v3:dispatch(v4);
    end;
end;