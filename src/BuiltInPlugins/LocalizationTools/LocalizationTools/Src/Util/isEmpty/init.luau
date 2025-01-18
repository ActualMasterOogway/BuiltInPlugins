return function(v0) --[[ Line: 1 ]] --[[ Name: isEmpty ]]
    assert(v0 ~= nil, "object must not be nil");
    return next(v0) == nil;
end;