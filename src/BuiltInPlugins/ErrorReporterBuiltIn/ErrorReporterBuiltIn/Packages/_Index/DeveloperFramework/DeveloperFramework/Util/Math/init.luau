local v0 = require(script.Parent.Typecheck.t);
local v5 = {
    round = function(v1, v2) --[[ Line: 15 ]] --[[ Name: round ]]
        -- upvalues: v0 (copy)
        assert(v0.number(v1), "num must be a number");
        assert(v0.optional(v0.number)(v2), "numDecimalPlaces must be a number or nil");
        local v3 = 10 ^ (v2 or 0);
        return math.floor(v1 * v3 + 0.5) / v3;
    end, 
    isNaN = function(v4) --[[ Line: 23 ]] --[[ Name: isNaN ]]
        return v4 ~= v4;
    end, 
    NEAR_ZERO = 1.0E-4
};
v5.fuzzyEq = function(v6, v7, v8) --[[ Line: 29 ]] --[[ Name: fuzzyEq ]]
    -- upvalues: v5 (copy)
    return (v8 or v5.NEAR_ZERO) > math.abs(v6 - v7);
end;
return v5;