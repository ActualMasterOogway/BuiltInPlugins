return function(v0, v1) --[[ Line: 1 ]] --[[ Name: internalAssert ]]
    if not v0 then
        error(v1 .. " (This is probably a bug in Roact!)", 3);
    end;
end;