local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugNewExplorerLogging);
return function(v2) --[[ Line: 7 ]] --[[ Name: createDebugLogger ]]
    -- upvalues: v1 (copy)
    local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
    if l_script_FirstAncestorWhichIsA_0 ~= nil then
        v2 = ("%*.%*"):format(l_script_FirstAncestorWhichIsA_0.HostDataModelType.Name, v2);
    end;
    return function(v4, ...) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (ref)
        if not v1() then
            return;
        elseif typeof(v4) == "string" then
            print((("[%*] %*"):format(v2, (string.format(v4, ...)))));
            return;
        else
            print(("[%*]"):format(v2), v4(...));
            return;
        end;
    end;
end;