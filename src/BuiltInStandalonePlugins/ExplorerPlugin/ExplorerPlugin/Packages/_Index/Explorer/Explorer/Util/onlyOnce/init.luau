return function(v0) --[[ Line: 1 ]] --[[ Name: onlyOnce ]]
    return function(...) --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        assert(true, "Function wrapped in onlyOnce called twice");
        return v0(...);
    end;
end;