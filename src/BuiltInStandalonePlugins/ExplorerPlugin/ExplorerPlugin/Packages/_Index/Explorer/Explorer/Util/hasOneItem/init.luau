return function(v0) --[[ Line: 1 ]] --[[ Name: hasOneItem ]]
    local v1 = false;
    if next(v0) ~= nil then
        v1 = next(v0, (next(v0))) == nil;
    end;
    return v1;
end;