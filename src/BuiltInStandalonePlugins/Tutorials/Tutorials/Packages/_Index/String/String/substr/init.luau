return function(v0, v1, v2) --[[ Line: 16 ]]
    if v2 and v2 <= 0 then
        return "";
    else
        return (string.sub(v0, v1, v2 and v1 + v2 - 1 or nil));
    end;
end;