return {
    Threshold = function(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: Threshold ]]
        if v2 ~= 0 then
            return (math.clamp((v0 - v1) / v2, 0, 1));
        elseif v0 <= v1 then
            return 0;
        else
            return 1;
        end;
    end, 
    Ridge = function(v3) --[[ Line: 11 ]] --[[ Name: Ridge ]]
        if v3 < 0.5 then
            return v3 * 2;
        else
            return 2 - v3 * 2;
        end;
    end, 
    RidgeFlipped = function(v4) --[[ Line: 15 ]] --[[ Name: RidgeFlipped ]]
        if v4 < 0.5 then
            return 1 - v4 * 2;
        else
            return v4 * 2 - 1;
        end;
    end
};