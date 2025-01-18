return function(v0) --[[ Line: 1 ]] --[[ Name: createUnimplemented ]]
    return function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        error((("Calling unimplemented function %*"):format(v0)));
    end;
end;