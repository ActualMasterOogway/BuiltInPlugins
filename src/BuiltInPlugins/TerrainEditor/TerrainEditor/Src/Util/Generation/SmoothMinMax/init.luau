return {
    Max = function(v0, v1, v2) --[[ Line: 4 ]] --[[ Name: Max ]]
        local v3 = math.max(v2 - math.abs(v0 - v1), 0);
        return math.max(v0, v1) + v3 * v3 * v3 / (6 * v2 * v2);
    end, 
    Min = function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: Min ]]
        local v7 = math.max(v6 - math.abs(v4 - v5), 0);
        return math.min(v4, v5) - v7 * v7 * v7 / (6 * v6 * v6);
    end
};