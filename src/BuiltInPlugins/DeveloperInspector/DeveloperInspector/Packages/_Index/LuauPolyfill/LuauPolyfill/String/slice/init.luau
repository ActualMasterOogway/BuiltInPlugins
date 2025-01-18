return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: slice ]]
    local v3 = utf8.len(v0);
    local v4 = tonumber(v1);
    assert(typeof(v4) == "number", "startIndexStr should be a number");
    if v4 + v3 < 0 then
        v4 = 1;
    end;
    if v3 < v4 then
        return "";
    else
        local v5 = v3 + 1;
        if v2 ~= nil then
            v5 = tonumber(v2);
        end;
        assert(typeof(v5) == "number", "lastIndexStr should convert to number");
        if v3 < v5 then
            v5 = v3 + 1;
        end;
        return (string.sub(v0, utf8.offset(v0, v4), utf8.offset(v0, v5) - 1));
    end;
end;