local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Parent.Signal);
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: useEventConnection ]]
    -- upvalues: v1 (copy)
    local v6 = v1.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy)
        return v4;
    end, v5);
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v3 (copy), v6 (copy)
        local v7 = if typeof(v3) == "RBXScriptSignal" then v3:Connect(v6) else v3:Connect(v6);
        return function() --[[ Line: 22 ]]
            -- upvalues: v7 (copy)
            if typeof(v7) == "RBXScriptConnection" then
                v7:Disconnect();
                return;
            else
                v7:Disconnect();
                return;
            end;
        end;
    end, {
        v3, 
        v6
    });
end;