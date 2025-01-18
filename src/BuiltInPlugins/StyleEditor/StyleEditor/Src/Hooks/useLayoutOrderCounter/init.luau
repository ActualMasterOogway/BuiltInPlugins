return function() --[[ Line: 3 ]] --[[ Name: useLayoutOrderCounter ]]
    local v0 = 0;
    return function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref)
        v0 = v0 + 1;
        return v0 - 1;
    end;
end;