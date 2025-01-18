return function(v0) --[[ Line: 5 ]]
    local v1 = math.round(v0);
    if math.abs(v0 - v1) < 0.001 then
        return string.format("%d", v1);
    else
        local v2 = math.round(v0 * 10) / 10;
        if math.abs(v0 - v2) < 0.001 then
            return string.format("%.1f", v2);
        else
            local v3 = math.round(v0 * 100) / 100;
            if math.abs(v0 - v3) < 0.001 then
                return string.format("%.2f", v3);
            else
                return string.format("%.3f", v0);
            end;
        end;
    end;
end;