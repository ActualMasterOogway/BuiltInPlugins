return function(v0) --[[ Line: 6 ]]
    local v1 = #v0;
    if v1 < 9 then
        return false;
    elseif v1 > 12 then
        return false;
    else
        local v2 = string.sub(v0, 1, 1);
        if not string.find(v0, "[^" .. v2 .. "]") then
            return false;
        else
            local v3 = 0;
            local v4 = 1;
            while true do
                v4 = string.find(v0, "0", v4, true);
                if v4 then
                    v3 = v3 + 1;
                    v4 = v4 + 1;
                else
                    break;
                end;
            end;
            return v3 / v1 <= 0.5;
        end;
    end;
end;