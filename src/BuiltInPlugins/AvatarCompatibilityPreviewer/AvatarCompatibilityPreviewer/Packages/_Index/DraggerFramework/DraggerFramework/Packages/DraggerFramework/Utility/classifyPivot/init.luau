local v0 = Vector3.new();
return function(_, v2, v3) --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    if v2:FuzzyEq(v0, 0.01) then
        return "Center";
    else
        local v4 = Vector3.new(math.abs(v2.X), math.abs(v2.Y), (math.abs(v2.Z))) - v3 / 2;
        local v5 = false;
        if v4.X < 0.01 then
            v5 = false;
            if v4.Y < 0.01 then
                v5 = v4.Z < 0.01;
            end;
        end;
        if v5 then
            if math.abs(v4.X) < 0.01 or math.abs(v4.Y) < 0.01 or math.abs(v4.Z) < 0.01 then
                return "Surface";
            else
                return "Inside";
            end;
        else
            local v6 = v4 / v3;
            if math.max(v6.X, v6.Y, v6.Z) > 1 then
                return "Far";
            else
                return "Outside";
            end;
        end;
    end;
end;