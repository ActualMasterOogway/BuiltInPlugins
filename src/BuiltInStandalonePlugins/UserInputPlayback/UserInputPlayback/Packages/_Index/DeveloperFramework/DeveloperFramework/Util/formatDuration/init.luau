return function(v0) --[[ Line: 5 ]]
    assert(type(v0) == "number", "seconds must be a number");
    local v1 = v0 < 0;
    local v2 = math.abs(v0);
    local v3 = math.floor(v2 / 60);
    local v4 = math.floor(math.round(v2) % 60);
    return string.format("%s%d:%02d", v1 and "-" or "", v3, v4);
end;