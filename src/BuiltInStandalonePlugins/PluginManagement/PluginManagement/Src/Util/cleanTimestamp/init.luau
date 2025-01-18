return function(v0) --[[ Line: 5 ]]
    local v1 = v0:find("%.");
    if v1 then
        return v0:sub(1, v1 - 1) .. "Z";
    else
        return v0;
    end;
end;