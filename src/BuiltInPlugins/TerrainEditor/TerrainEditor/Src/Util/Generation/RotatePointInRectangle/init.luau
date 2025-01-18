local function _(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: rotatePoint ]]
    local v3 = math.cos(v2);
    local v4 = math.sin(v2);
    return v0 * v3 - v1 * v4, v0 * v4 + v1 * v3;
end;
return function(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: RotatePointInRectangle ]]
    local v9 = v6 / 2;
    local v10 = v7 / 2;
    return function(v11, v12) --[[ Line: 16 ]] --[[ Name: getRotatedPoint ]]
        -- upvalues: v8 (copy), v9 (copy), v10 (copy)
        if v8 == 0 or v8 == 360 then
            return v11, v12;
        else
            local v13 = v11 - v9;
            local v14 = v12 - v10;
            local l_v8_0 = v8;
            local v16 = math.cos(l_v8_0);
            local v17 = math.sin(l_v8_0);
            local v18 = v13 * v16 - v14 * v17;
            local v19 = v13 * v17 + v14 * v16;
            return v18 + v9, v19 + v10;
        end;
    end;
end;