return function() --[[ Line: 1 ]] --[[ Name: counter ]]
    local v0 = 0;
    return function() --[[ Line: 3 ]]
        -- upvalues: v0 (ref)
        v0 = v0 + 1;
        return v0;
    end;
end;