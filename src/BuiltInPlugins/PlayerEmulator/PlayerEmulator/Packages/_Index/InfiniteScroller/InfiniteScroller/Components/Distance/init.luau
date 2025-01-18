return {
    fromPointToRangeSigned = function(v0, v1, v2) --[[ Line: 5 ]] --[[ Name: fromPointToRangeSigned ]]
        local v3 = v1 + v2;
        if v0 < v1 then
            return v0 - v1;
        elseif v3 < v0 then
            return v0 - v3;
        else
            return 0;
        end;
    end
};