return function(v0) --[[ Line: 3 ]] --[[ Name: NoisySeed ]]
    local v1 = nil;
    math.randomseed(6180339);
    v1 = {};
    for _ = 1, 999 do
        table.insert(v1, math.random());
    end;
    return function(v3) --[[ Line: 13 ]] --[[ Name: getNoise ]]
        -- upvalues: v0 (copy), v1 (ref)
        local l_X_0 = v3.X;
        local l_Y_0 = v3.Y;
        local l_Z_0 = v3.Z;
        local v7 = l_X_0 + l_Y_0 + l_Z_0 + 7 + v0 + (v0 - l_X_0) * (7 + l_Z_0) + (7 - l_Y_0) * (v0 + l_Z_0);
        local v8 = math.floor((math.fmod(v7, #v1)));
        if v7 < 0 then
            v8 = math.clamp(v8 + #v1 - 1, 0, #v1 - 1);
        end;
        return v1[v8 + 1];
    end;
end;