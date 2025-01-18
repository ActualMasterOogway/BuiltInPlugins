return function(v0) --[[ Line: 1 ]] --[[ Name: fixSlightlyOffgridOrientation ]]
    local l_v0_Components_0, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12 = v0:GetComponents();
    local v13 = false;
    if math.abs(v4) < 1.0E-5 and v4 ~= 0 then
        v4 = 0;
        v13 = true;
    end;
    if math.abs(v5) < 1.0E-5 and v5 ~= 0 then
        v5 = 0;
        v13 = true;
    end;
    if math.abs(v6) < 1.0E-5 and v6 ~= 0 then
        v6 = 0;
        v13 = true;
    end;
    if math.abs(v7) < 1.0E-5 and v7 ~= 0 then
        v7 = 0;
        v13 = true;
    end;
    if math.abs(v8) < 1.0E-5 and v8 ~= 0 then
        v8 = 0;
        v13 = true;
    end;
    if math.abs(v9) < 1.0E-5 and v9 ~= 0 then
        v9 = 0;
        v13 = true;
    end;
    if math.abs(v10) < 1.0E-5 and v10 ~= 0 then
        v10 = 0;
        v13 = true;
    end;
    if math.abs(v11) < 1.0E-5 and v11 ~= 0 then
        v11 = 0;
        v13 = true;
    end;
    if math.abs(v12) < 1.0E-5 and v12 ~= 0 then
        v12 = 0;
        v13 = true;
    end;
    if v13 then
        if math.abs(v4 - 1) < 1.0E-5 then
            v4 = 1;
        elseif math.abs(v4 + 1) < 1.0E-5 then
            v4 = -1;
        end;
        if math.abs(v5 - 1) < 1.0E-5 then
            v5 = 1;
        elseif math.abs(v5 + 1) < 1.0E-5 then
            v5 = -1;
        end;
        if math.abs(v6 - 1) < 1.0E-5 then
            v6 = 1;
        elseif math.abs(v6 + 1) < 1.0E-5 then
            v6 = -1;
        end;
        if math.abs(v7 - 1) < 1.0E-5 then
            v7 = 1;
        elseif math.abs(v7 + 1) < 1.0E-5 then
            v7 = -1;
        end;
        if math.abs(v8 - 1) < 1.0E-5 then
            v8 = 1;
        elseif math.abs(v8 + 1) < 1.0E-5 then
            v8 = -1;
        end;
        if math.abs(v9 - 1) < 1.0E-5 then
            v9 = 1;
        elseif math.abs(v9 + 1) < 1.0E-5 then
            v9 = -1;
        end;
        if math.abs(v10 - 1) < 1.0E-5 then
            v10 = 1;
        elseif math.abs(v10 + 1) < 1.0E-5 then
            v10 = -1;
        end;
        if math.abs(v11 - 1) < 1.0E-5 then
            v11 = 1;
        elseif math.abs(v11 + 1) < 1.0E-5 then
            v11 = -1;
        end;
        if math.abs(v12 - 1) < 1.0E-5 then
            v12 = 1;
        elseif math.abs(v12 + 1) < 1.0E-5 then
            v12 = -1;
        end;
        return CFrame.new(l_v0_Components_0, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
    else
        return v0;
    end;
end;