local v3 = {
    fuzzyEq = function(_, v1, v2) --[[ Line: 3 ]] --[[ Name: fuzzyEq ]]
        return math.abs(v1 - v2) < 0.001;
    end
};
v3.fuzzyEq_CFrame = function(_, v5, v6) --[[ Line: 8 ]] --[[ Name: fuzzyEq_CFrame ]]
    -- upvalues: v3 (copy)
    local v7, v8, v9 = v5:ToEulerAnglesXYZ();
    local v10, v11, v12 = v6:ToEulerAnglesXYZ();
    return v5.p:FuzzyEq(v6.p) and v3:fuzzyEq(v7, v10) and v3:fuzzyEq(v8, v11) and v3:fuzzyEq(v9, v12);
end;
v3.adornLocalSpace = function(_, v14, v15) --[[ Line: 17 ]] --[[ Name: adornLocalSpace ]]
    return v14.CFrame:inverse() * CFrame.new(v15);
end;
v3.pointInRect = function(_, v17, v18, v19, v20, v21) --[[ Line: 21 ]] --[[ Name: pointInRect ]]
    if v17.X >= v18.X and v17.X <= v18.X + v20 and v17.Y >= v19.Y and v17.Y <= v19.Y + v21 then
        return true;
    else
        return false;
    end;
end;
return v3;