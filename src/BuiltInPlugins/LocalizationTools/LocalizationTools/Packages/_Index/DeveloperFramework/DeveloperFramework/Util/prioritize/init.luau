return function(v0, v1, v2) --[[ Line: 2 ]]
    if v0 ~= nil then
        return v0;
    elseif v1 ~= nil then
        return v1;
    else
        return v2;
    end;
end;