local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local _ = require(l_Parent_0.createGuiControlStateTable);
local v5 = require(l_Parent_0.useGuiControlState);
local v6 = require(l_script_FirstAncestor_0.Enums.ControlState);
return function(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: useGuiControlStateWithBinding ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy)
    local v10, v11 = v3.useBinding(v6.Initialize);
    local v13 = v3.useCallback(function(v12) --[[ Line: 19 ]]
        -- upvalues: v11 (copy), v9 (copy)
        v11(v12);
        if v9 then
            v9(v12);
        end;
    end, {
        v9
    });
    local v14, v15 = v5(v7, v13, true);
    v3.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v8 (copy), v15 (copy)
        if v8 then
            v15.events.Disabled();
            return;
        else
            v15.events.Enabled();
            return;
        end;
    end, {
        v8, 
        v15
    });
    return v14, v10;
end;