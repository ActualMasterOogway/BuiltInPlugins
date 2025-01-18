local l_Selection_0 = game:GetService("Selection");
return function(v1) --[[ Line: 3 ]] --[[ Name: listenForFocus ]]
    -- upvalues: l_Selection_0 (copy)
    local v2 = l_Selection_0:AddFocusCallback(1, function() --[[ Line: 4 ]]
        -- upvalues: v1 (copy)
        v1();
        return Vector3.zero, Vector3.zero;
    end);
    return function() --[[ Line: 9 ]]
        -- upvalues: v2 (copy)
        v2:Disconnect();
    end;
end;