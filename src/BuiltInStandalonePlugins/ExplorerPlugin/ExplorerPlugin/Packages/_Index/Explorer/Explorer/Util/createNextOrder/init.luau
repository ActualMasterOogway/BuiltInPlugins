return function(v0) --[[ Line: 2 ]] --[[ Name: createNextOrder ]]
    local v1 = v0 or 0;
    return function() --[[ Line: 5 ]]
        -- upvalues: v1 (ref)
        v1 = v1 + 1;
        return v1;
    end;
end;