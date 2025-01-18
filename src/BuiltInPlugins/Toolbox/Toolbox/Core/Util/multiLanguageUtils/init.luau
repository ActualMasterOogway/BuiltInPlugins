local v0 = {};
local function v5(v1, v2) --[[ Line: 5 ]]
    if utf8.len(v1) == string.len(v1) then
        return v2(v1);
    else
        for _, v4 in utf8.codes(v1) do
            if string.len((utf8.char(v4))) == 1 then
                return v2(utf8.nfdnormalize(v1));
            end;
        end;
        return v1;
    end;
end;
v0.upper = function(v6) --[[ Line: 19 ]]
    -- upvalues: v5 (copy)
    return v5(v6, string.upper);
end;
v0.lower = function(v7) --[[ Line: 23 ]]
    -- upvalues: v5 (copy)
    return v5(v7, string.lower);
end;
return v0;