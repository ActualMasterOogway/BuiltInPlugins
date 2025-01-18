return {
    createIsEqualWithTolerance = function(v0) --[[ Line: 7 ]] --[[ Name: createIsEqualWithTolerance ]]
        return function(v1, v2) --[[ Line: 8 ]]
            -- upvalues: v0 (copy)
            if v1 == nil or v2 == nil then
                return v1 == v2;
            else
                return math.abs(v1 - v2) <= v0;
            end;
        end;
    end
};