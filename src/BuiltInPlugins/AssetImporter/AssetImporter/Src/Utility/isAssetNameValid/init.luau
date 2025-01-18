return function(v0) --[[ Line: 3 ]]
    local v1 = v0 and v0:match("^%s*$") ~= nil;
    local v2 = false;
    if v0 ~= nil then
        v2 = false;
        if v0 ~= "" then
            v2 = not v1;
        end;
    end;
    return v2;
end;