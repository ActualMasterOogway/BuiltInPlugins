return function(v0, v1) --[[ Line: 1 ]] --[[ Name: hasProperty ]]
    local l_status_0, _ = pcall(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local _ = v0[v1];
    end);
    return l_status_0;
end;