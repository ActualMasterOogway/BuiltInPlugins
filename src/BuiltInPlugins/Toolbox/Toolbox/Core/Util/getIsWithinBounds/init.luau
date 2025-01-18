return function(v0, v1, v2) --[[ Line: 1 ]]
    if v1.X == 0 or v1.Y == 0 then
        return false;
    else
        local v3 = false;
        if v0.X >= v2.X then
            v3 = false;
            if v0.X <= v1.X + v2.X then
                v3 = false;
                if v0.Y >= v2.Y then
                    v3 = v0.Y <= v1.Y + v2.Y;
                end;
            end;
        end;
        return v3;
    end;
end;