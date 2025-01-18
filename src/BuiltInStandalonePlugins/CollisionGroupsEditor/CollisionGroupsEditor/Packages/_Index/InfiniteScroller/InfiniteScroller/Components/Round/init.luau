return {
    nearest = function(v0) --[[ Line: 4 ]] --[[ Name: nearest ]]
        local v1, v2 = math.modf(v0);
        if v2 <= -0.5 then
            return v1 - 1;
        elseif v2 >= 0.5 then
            return v1 + 1;
        else
            return v1;
        end;
    end, 
    towardsZero = function(v3) --[[ Line: 14 ]] --[[ Name: towardsZero ]]
        local v4, _ = math.modf(v3);
        return v4;
    end, 
    awayFromZero = function(v6) --[[ Line: 18 ]] --[[ Name: awayFromZero ]]
        local v7, v8 = math.modf(v6);
        if v8 < -1.0E-15 then
            return v7 - 1;
        elseif v8 > 1.0E-15 then
            return v7 + 1;
        else
            return v7;
        end;
    end
};