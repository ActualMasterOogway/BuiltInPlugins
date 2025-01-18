return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: startsWith ]]
    if v1:len() == 0 then
        return true;
    else
        if v2 == nil or v2 < 1 then
            v2 = 1;
        end;
        if v0:len() < v2 then
            return false;
        else
            local v3 = v2 or 1;
            return v0:find(v1, v3, true) == v3;
        end;
    end;
end;