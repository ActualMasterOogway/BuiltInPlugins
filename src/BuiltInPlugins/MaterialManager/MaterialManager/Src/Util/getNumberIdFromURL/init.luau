return function(v0) --[[ Line: 1 ]]
    local v1 = tonumber(v0:match("://(%d+)")) or tonumber(v0:match("(%d+)"));
    if v1 then
        return v1;
    else
        return nil;
    end;
end;